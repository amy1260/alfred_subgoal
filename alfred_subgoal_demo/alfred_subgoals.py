#!/usr/bin/env python3
"""
ALFRED subgoal splitter, runnable without AI2-THOR.

Reuses ALFRED's own code for the parts that matter:
  - gen/goal_library.py                          PDDL goal template per task type
  - gen/planner/domains/PutTaskExtended_domain.pddl   action definitions
  - gen/ff_planner/ff                            Metric-FF planner (compiled C)
  - gen/planner/ff_planner_handler.py            runs FF and parses its output
  - gen/utils/game_util.py                       get_discrete_hl_action() -> high_pddl subgoals

The only part replaced is the simulator: instead of reading AI2-THOR metadata
(PlannedGameState.state_to_pddl), the scene is read from a small JSON file.

Usage:
  export ALFRED_ROOT=/path/to/alfred
  python alfred_subgoals.py scenes/kitchen.json --task pick_heat_then_place_in_recep \
         --obj Apple --recep CounterTop
  python alfred_subgoals.py scenes/kitchen.json --all      # run every demo task in the file
"""
import argparse
import json
import os
import sys

ALFRED_ROOT = os.environ.get("ALFRED_ROOT", os.path.join(os.path.dirname(__file__), "..", "alfred"))
ALFRED_ROOT = os.path.abspath(ALFRED_ROOT)
GEN = os.path.join(ALFRED_ROOT, "gen")
if not os.path.isdir(GEN):
    sys.exit(f"Cannot find ALFRED gen/ folder at {GEN}. Set ALFRED_ROOT to your alfred clone.")
sys.path[:0] = [ALFRED_ROOT, GEN]

import constants                                   # noqa: E402  (ALFRED)
import goal_library as glib                        # noqa: E402  (ALFRED)
from planner import ff_planner_handler as ffh      # noqa: E402  (ALFRED)
from utils import game_util, py_util               # noqa: E402  (ALFRED)

constants.DEBUG = False  # silence ALFRED's per-solver timing prints
DOMAIN = os.path.join(GEN, "planner", "domains", "PutTaskExtended_domain.pddl")
FF_BIN = os.path.join(GEN, "ff_planner", "ff")


def fix_pddl_str_chars(s):
    """Same substitutions as PlannedGameState.fix_pddl_str_chars in ALFRED."""
    return py_util.multireplace(s, {'-': '_minus_', '#': '-', '|': '_bar_',
                                    '+': '_plus_', '.': '_dot_', ',': '_comma_'})


def loc_xy(loc):
    _, x, z, *_ = loc.split('|')
    return int(x), int(z)


def restore_goal(goals):
    """Housekeeping extension (not in ALFRED): several 'put object X into a receptacle of type R'
    conditions in ONE goal, so the planner picks the visiting order that minimises travel."""
    conds = []
    for g in goals:
        conds.append(f"""
                (exists (?r # receptacle)
                    (and (inReceptacle {g['object_id']} ?r) (receptacleType ?r {g['recep']}Type)))""")
    return f"""
        (:goal
            (and{''.join(conds)}
                (forall (?re # receptacle) (not (opened ?re)))
            )
        )
    )
"""


def build_problem(scene, task, obj, recep=None, mrecep=None, toggle=None, sliced=False, goals=None):
    """Build a PDDL problem the same way PlannedGameState.state_to_pddl does."""
    movable = constants.MOVABLE_RECEPTACLES_SET
    recep_classes = set(constants.RECEPTACLES) - set(movable)
    obj_classes = set(constants.OBJECTS_SET) - recep_classes
    VAL = constants.VAL_ACTION_OBJECTS

    receps = scene["receptacles"]
    objs = scene["objects"]
    recep_loc = {r["id"]: r["loc"] for r in receps}

    # where every object sits
    obj_loc = {}
    for o in objs:
        if "in" in o:
            obj_loc[o["id"]] = recep_loc[o["in"]]
        elif "in_object" in o:
            parent = next(p for p in objs if p["id"] == o["in_object"])
            obj_loc[o["id"]] = recep_loc[parent["in"]]
        else:
            obj_loc[o["id"]] = o["loc"]

    locations = sorted(set(recep_loc.values()) | set(obj_loc.values()) | {scene["agent_start"]})

    header = "\n        ".join(
        ["agent1 # agent"]
        + [c + " # object" for c in sorted(obj_classes)]
        + [c + "Type # otype" for c in sorted(obj_classes)]
        + [c + "Type # rtype" for c in sorted(recep_classes)]
    )
    decl = "\n        ".join(
        [o["id"] + " # object" for o in objs]
        + [r["id"] + " # receptacle" for r in receps]
        + [l + " # location" for l in locations]
    )

    f = ["(= (totalCost) 0)", f"(atLocation agent1 {scene['agent_start']})"]
    for r in receps:
        f.append(f"(receptacleType {r['id']} {r['type']}Type)")
        f.append(f"(receptacleAtLocation {r['id']} {r['loc']})")
        if r["type"] in constants.OPENABLE_CLASS_SET:
            f.append(f"(openable {r['id']})")
    for o in objs:
        t, oid = o["type"], o["id"]
        f.append(f"(objectType {oid} {t}Type)")
        f.append(f"(objectAtLocation {oid} {obj_loc[oid]})")
        if "in" in o:
            f.append(f"(inReceptacle {oid} {o['in']})")
        if "in_object" in o:
            parent = next(p for p in objs if p["id"] == o["in_object"])
            f.append(f"(inReceptacleObject {oid} {parent['id']})")
            f.append(f"(inReceptacle {oid} {parent['in']})")
        if t in VAL["Cleanable"]:
            f.append(f"(cleanable {oid})")
        if t in VAL["Heatable"]:
            f.append(f"(heatable {oid})")
        if t in VAL["Coolable"]:
            f.append(f"(coolable {oid})")
        if t in VAL["Sliceable"]:
            f.append(f"(sliceable {oid})")
        if toggle and t == toggle:
            f.append(f"(toggleable {oid})")
        if mrecep and t == mrecep and t in movable:
            f.append(f"(isReceptacleObject {oid})")
    # distances: grid Manhattan distance + 1 (ALFRED uses shortest-path length + 1)
    for a in locations:
        for b in locations:
            if a != b:
                (x1, z1), (x2, z2) = loc_xy(a), loc_xy(b)
                f.append(f"(= (distance {a} {b}) {abs(x1 - x2) + abs(z1 - z2) + 1})")
    init = "\n        ".join(f)

    if task == "restore":
        goal = restore_goal(goals)
    else:
        goal_type = task + ("_slice" if sliced else "")
        goal = glib.gdict[goal_type]["pddl"].format(obj=obj, recep=recep or "", toggle=toggle or "",
                                                    mrecep=mrecep or "")
    problem = f"""
(define (problem plan_demo)
    (:domain put_task)
    (:metric minimize (totalCost))
    (:objects
        {header}
        {decl}
    )
    (:init
        {init}
    )
{goal}"""
    return fix_pddl_str_chars(problem)


def plan(problem_path):
    """Run FF with solver types 3,4,5 like PlanParser.get_plan, keep the shortest plan."""
    cwd = os.getcwd()
    os.chdir(GEN)  # ff_planner_handler calls 'ff_planner/ff' with a relative path
    try:
        plans = [ffh.get_plan_from_file((DOMAIN, problem_path, s)) for s in (3, 4, 5)]
    finally:
        os.chdir(cwd)
    plans = [p for p in plans if p and p[0] != 'timeout']
    cleaned = []
    for p in plans:  # PlanParser.clean_plan: drop consecutive GotoLocation
        q = [p[i] for i in range(len(p) - 1)
             if not (p[i]['action'] == 'GotoLocation' and p[i + 1]['action'] == 'GotoLocation')]
        cleaned.append(q + [p[-1]])
    return min(cleaned, key=len) if cleaned else [{'action': 'End', 'value': 0}]


def to_high_pddl(parsed_plan):
    """Same record format PlanAgent.save_plan writes into traj_data['plan']['high_pddl']."""
    high, held = [], ""
    for idx, a in enumerate(parsed_plan):
        if a['action'] == 'End':
            break
        d = game_util.get_discrete_hl_action(parsed_plan, idx)
        desc = game_util.get_templated_action_str(parsed_plan, idx)
        # ALFRED reads the object of Clean/Heat/Cool from plan[idx-2], assuming a GotoLocation
        # sits between Pickup and the state change. When the object was already next to the
        # sink/microwave/fridge there is no GotoLocation, so fill in the held object instead.
        if d['action'] in ('CleanObject', 'HeatObject', 'CoolObject') and not d['args'][0] and held:
            d['args'] = [held]
            desc = desc.rstrip() + " " + held
        if d['action'] == 'PickupObject':
            held = d['args'][0]
        elif d['action'] == 'PutObject':
            held = ""
        high.append({"high_idx": idx, "planner_action": a, "discrete_action": d, "template_desc": desc})
    return high


def run(scene, task_spec, out_dir, verbose=False):
    name = task_spec.get("name", task_spec["task"])
    problem = build_problem(scene, task_spec["task"], task_spec.get("obj"), task_spec.get("recep"),
                            task_spec.get("mrecep"), task_spec.get("toggle"), task_spec.get("sliced", False),
                            task_spec.get("goals"))
    os.makedirs(out_dir, exist_ok=True)
    p_path = os.path.abspath(os.path.join(out_dir, f"problem_{name}.pddl"))
    with open(p_path, "w") as fh:
        fh.write(problem)

    parsed = plan(p_path)
    high = to_high_pddl(parsed)
    with open(os.path.join(out_dir, f"high_pddl_{name}.json"), "w") as fh:
        json.dump(high, fh, indent=2)

    print(f"\n=== {name}: {task_spec['task']}  obj={task_spec.get('obj')} recep={task_spec.get('recep')} "
          f"mrecep={task_spec.get('mrecep')} toggle={task_spec.get('toggle')} sliced={task_spec.get('sliced', False)}")
    if not high:
        print("  (no plan found — check the scene facts)")
    for h in high:
        d = h["discrete_action"]
        print(f"  {h['high_idx']:>2}  {d['action']:<14} {', '.join(d['args']):<32} | {h['template_desc']}")
    if verbose:
        print(f"  problem: {p_path}")
    return high


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("scene")
    ap.add_argument("--task", choices=sorted(glib.gdict))
    ap.add_argument("--obj")
    ap.add_argument("--recep")
    ap.add_argument("--mrecep")
    ap.add_argument("--toggle")
    ap.add_argument("--sliced", action="store_true")
    ap.add_argument("--all", action="store_true", help="run every task listed under 'demo_tasks' in the scene file")
    ap.add_argument("--out", default="output")
    ap.add_argument("-v", "--verbose", action="store_true")
    args = ap.parse_args()

    if not os.path.exists(FF_BIN):
        sys.exit(f"FF planner not built: {FF_BIN}\nRun: cd {GEN}/ff_planner && make CFLAGS='-O3 -ansi -g -fcommon'")

    with open(args.scene) as fh:
        scene = json.load(fh)

    if args.all:
        for t in scene.get("demo_tasks", []):
            run(scene, t, args.out, args.verbose)
    else:
        if not (args.task and args.obj):
            ap.error("give --task and --obj, or use --all")
        run(scene, {"task": args.task, "obj": args.obj, "recep": args.recep, "mrecep": args.mrecep,
                    "toggle": args.toggle, "sliced": args.sliced}, args.out, args.verbose)


if __name__ == "__main__":
    main()
