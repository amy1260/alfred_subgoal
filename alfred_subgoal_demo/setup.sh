#!/usr/bin/env bash
# One-time setup for the ALFRED subgoal demo on Linux / WSL (Ubuntu) / macOS.
# Clones ALFRED next to this folder, builds the Metric-FF planner, and runs one example.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
ALFRED_ROOT="${ALFRED_ROOT:-$HERE/../alfred}"

# 1. build tools (gcc, make, flex, bison)
if ! command -v gcc >/dev/null || { [ ! -x "$ALFRED_ROOT/gen/ff_planner/build_ff.sh" ] && ! command -v flex >/dev/null; }; then
  if command -v apt-get >/dev/null; then
    sudo apt-get update && sudo apt-get install -y build-essential flex bison git python3
  elif command -v brew >/dev/null; then
    brew install flex bison
  else
    echo "Please install gcc, make, flex and bison, then re-run." && exit 1
  fi
fi

# ALFRED's gen/utils/game_util.py imports numpy and cv2
python3 -c "import numpy, cv2" 2>/dev/null || python3 -m pip install --user numpy opencv-python-headless \
  || python3 -m pip install --user --break-system-packages numpy opencv-python-headless

# 2. ALFRED source (only the gen/ folder is used; no AI2-THOR needed)
if [ ! -d "$ALFRED_ROOT/gen" ]; then
  git clone --depth 1 https://github.com/askforalfred/alfred "$ALFRED_ROOT"
fi

# 3. build Metric-FF. -fcommon is needed on GCC 10+ (otherwise: "multiple definition of lnum_F")
cd "$ALFRED_ROOT/gen/ff_planner"
if [ ! -x ff ]; then
  if [ -x build_ff.sh ]; then
    ./build_ff.sh                      # bundled copy: gcc only, no flex/bison needed
  else
    make clean >/dev/null 2>&1 || true
    make CFLAGS="-O3 -ansi -g -fcommon"
  fi
fi
./run_sample.sh | grep -A8 "found legal plan"

# 4. run the demo
cd "$HERE"
export ALFRED_ROOT
python3 alfred_subgoals.py scenes/kitchen.json --task pick_heat_then_place_in_recep --obj Apple --recep CounterTop
echo
echo "Setup done. Next time run:  export ALFRED_ROOT=$ALFRED_ROOT"
