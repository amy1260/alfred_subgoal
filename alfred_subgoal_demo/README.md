# ALFRED 子目標拆分（本地端、不需模擬器）

這個資料夾把 ALFRED 生成專家資料時「把任務拆成子目標」的那段程式抽出來單獨執行。
**直接使用 ALFRED 原始程式**，只把「從 AI2-THOR 讀取場景狀態」換成讀 JSON 檔：

| 用到的 ALFRED 原始程式 | 作用 |
|---|---|
| `gen/goal_library.py` | 每種任務的 PDDL 目標模板 |
| `gen/planner/domains/PutTaskExtended_domain.pddl` | 動作定義（前置條件、效果、成本） |
| `gen/ff_planner/ff` | Metric-FF 規劃器（C 程式，需編譯） |
| `gen/planner/ff_planner_handler.py` | 呼叫 FF、解析輸出 |
| `gen/utils/game_util.py` | `get_discrete_hl_action()` 轉成 `high_pddl` 子目標格式 |

`alfred_subgoals.py` 取代的是 `gen/game_states/planned_game_state.py` 的 `state_to_pddl()`。

## 安裝（Linux / WSL / macOS）

Windows 請先安裝 WSL（PowerShell 執行 `wsl --install`，重開機後開啟 Ubuntu），再在 Ubuntu 裡操作。
FF 規劃器是 C 程式，用 Windows 原生環境編譯很麻煩，WSL 最簡單。

```bash
cd alfred_subgoal_demo
./setup.sh
```

`setup.sh` 會做四件事：

1. 安裝 gcc、make、flex、bison。
2. 安裝 numpy 和 opencv（ALFRED 的 `game_util.py` 需要）。
3. 在旁邊 clone ALFRED，並編譯 FF。GCC 10 以上要加 `-fcommon`，否則會出現 `multiple definition of lnum_F`。
4. 跑一個範例。

## 執行

```bash
export ALFRED_ROOT=../alfred      # ALFRED clone 的位置

# 單一任務
python3 alfred_subgoals.py scenes/kitchen.json --task pick_heat_then_place_in_recep --obj Apple --recep CounterTop
python3 alfred_subgoals.py scenes/kitchen.json --task pick_cool_then_place_in_recep --obj Tomato --recep Cabinet --sliced

# 跑場景檔裡 demo_tasks 列出的全部任務
python3 alfred_subgoals.py scenes/kitchen.json --all      # ALFRED 7 種任務類型 + 切片
python3 alfred_subgoals.py scenes/hotel_room.json --all   # 飯店房間範例
```

輸出會存在 `output/`：

- `problem_<name>.pddl`：送進 FF 的 PDDL problem。
- `high_pddl_<name>.json`：子目標清單，格式和 ALFRED `traj_data.json` 的 `plan.high_pddl` 相同。

範例輸出：

```
=== heat: pick_heat_then_place_in_recep  obj=Apple recep=CounterTop
   0  GotoLocation   diningtable        | go to the diningtable
   1  PickupObject   apple              | pick up the apple
   2  GotoLocation   microwave          | go to the microwave
   3  HeatObject     apple              | heat the apple
   4  GotoLocation   countertop         | go to the countertop
   5  PutObject      apple, countertop  | put the apple in the countertop
```

## 參數

| 參數 | 說明 |
|---|---|
| `--task` | `goal_library.py` 裡的任務類型，例如 `pick_and_place_simple`、`pick_two_obj_and_place`、`look_at_obj_in_light` |
| `--obj` / `--recep` | 目標物類別、放置處類別 |
| `--mrecep` | 可移動容器（`pick_and_place_with_movable_recep` 用） |
| `--toggle` | 要開的燈（`look_at_obj_in_light` 用，例如 `FloorLamp`） |
| `--sliced` | 使用 `_slice` 版本的目標（要先拿刀切） |
| `--all` | 執行場景檔裡 `demo_tasks` 列出的所有任務 |

## 場景 JSON 格式

```json
{
  "agent_start": "loc|0|0|0|30",
  "receptacles": [ {"id": "Fridge|-01.50|+00.00|-02.50", "type": "Fridge", "loc": "loc|-5|-8|2|30"} ],
  "objects": [
    {"id": "Egg|-01.40|+00.60|-02.40", "type": "Egg", "in": "Fridge|-01.50|+00.00|-02.50"},
    {"id": "FloorLamp|-03.20|+00.00|+02.00", "type": "FloorLamp", "loc": "loc|-11|7|0|0"}
  ]
}
```

- `id` 用 ALFRED 的格式 `類別|x|y|z`，`type` 必須是 ALFRED 的類別名稱（見 `gen/constants.py` 的 `OBJECTS`）。
- `loc|x|z|方向|視角` 是代理人站著能碰到該容器的格點（一格 0.25 m）。距離用曼哈頓距離 + 1 估算（ALFRED 原本用導航圖的最短路徑）。
- 可開關（Fridge、Cabinet、Drawer…）、可加熱、可清洗等屬性，會依 `constants.VAL_ACTION_OBJECTS` 自動加上。

## 飯店擴充：`restore` 任務（不是 ALFRED 原有的）

ALFRED 一次只處理一個目標。`hotel_room.json` 的 `restore_room` 把多個「物品 → 標準位置」條件放進**同一個 PDDL goal**，由規劃器自己決定整理順序，盡量減少走動：

```json
{"name": "restore_room", "task": "restore", "goals": [
  {"object_id": "RemoteControl|+00.20|+00.55|+02.10", "recep": "SideTable"},
  {"object_id": "Newspaper|+01.40|+00.65|+02.40", "recep": "GarbageCan"}
]}
```

## 注意事項

- **子目標沒有 Open/Close**：ALFRED 的 domain 雖然定義了 OpenObject 和 CloseObject，但放置動作不要求容器開著，所以計畫裡不會出現。開關門在 ALFRED 裡是由低階控制器處理，評估時的子目標也只有 8 種（GotoLocation、PickupObject、PutObject、CoolObject、HeatObject、CleanObject、SliceObject、ToggleObject）。
- **Clean/Heat/Cool 的參數修正**：ALFRED 的 `get_discrete_hl_action()` 從往前第二步 `plan[idx-2]` 找物體，前提是 Pickup 和狀態變化之間有一個 GotoLocation。如果物體本來就在水槽、微波爐或冰箱旁，就會拿到空字串，所以這裡改用手上拿著的物體補上。
- **FF 不保證最佳解**：FF 使用 Enforced Hill-Climbing 加 A*。它會跑 3 種 solver 設定（3、4、5），取最短的計畫，和 ALFRED 的 `PlanParser.get_plan` 相同。
- **切片後的物體**：這個玩具場景沒有定義切片後的物體（例如 `TomatoSliced`），所以切完之後拿起的是原本的物體。
