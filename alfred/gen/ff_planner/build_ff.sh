#!/usr/bin/env bash
# Build Metric-FF with gcc only. The flex/bison outputs (lex.*.c, scan-*.tab.c) are pre-generated,
# so flex and bison are not needed. -fcommon is required on GCC 10+.
set -e
cd "$(dirname "$0")"
CF="-O3 -ansi -g -fcommon"
for f in main memory output parse expressions inst_pre inst_easy inst_hard inst_final relax search scan-fct_pddl.tab scan-ops_pddl.tab; do
  gcc -c $CF $f.c -o $f.o
done
gcc -o ff main.o memory.o output.o parse.o expressions.o inst_pre.o inst_easy.o inst_hard.o inst_final.o relax.o search.o scan-fct_pddl.tab.o scan-ops_pddl.tab.o $CF -lm
echo "built $(pwd)/ff"
