# 研究進度報告：以 ALFRED 古典規劃法拆分房務子目標

- **日期**：2026-09-30
- **主題**：飯店房務整理的任務拆解，也就是把主任務拆成子目標
- **本階段目標**：在本地端重現 ALFRED（Shridhar et al., CVPR 2020）拆分子目標的程式，並驗證它能不能延伸到飯店房間的整理任務

---

## 1. 背景與動機

飯店房間的特性是同房型擺設一致、而且可以事先掃描，所以房間的「標準狀態」是已知的。房務整理因此可以寫成：

> **退房後的現況 → 標準狀態**，由規劃器算出中間需要的子目標序列。

這正好符合古典符號規劃（PDDL）的前提：需要完整的場景狀態。ALFRED 在生成專家示範資料時，就是用這個方法把任務拆成子目標的。

## 2. 任務拆解方法比較

| 方法 | 代表 | 說明 |
| --- | --- | --- |
| 分類加模板 | [FILM](https://arxiv.org/abs/2110.07342) | 房務動作結構固定（歸位、收走、補充），模板穩定，但它不會重新規劃 |
| 模板加**環境記憶** | [CAPEAM](https://arxiv.org/abs/2308.07241) | 以 FILM 為基礎的架構，多了「記住物體在哪、哪些做過了」，正好符合房務要逐項處理多個物品的需求 |
| LLM 生成計畫 | LLM-Planner | 能處理沒預期的情況，但可能產生幻覺，可作為主要架構的輔助 |
| **古典符號規劃**（PDDL + 規劃器） | [ALFRED](https://arxiv.org/abs/1912.01734)（Metric-FF） | 只定義**目標狀態**（例如遙控器在床頭櫃），由規劃器依動作的前置條件自動算出步驟與最省距離的順序，計畫保證合法。需要**完整的場景狀態**，而房間能事先掃描正好滿足這點。多件物品可以放進同一個目標一起規劃；失敗時用新狀態重新規劃即可 |

## 3. 方法說明：ALFRED 如何拆分子目標

### 3.1 流程

```
任務類型 + 參數（物體、容器）
   │  goal_library.py：PDDL 目標模板
   ▼
PDDL goal ＋ 場景狀態（本研究改為讀取 JSON）→ PDDL problem
   │
   ▼
Metric-FF 規劃器 ＋ PutTaskExtended_domain.pddl（動作的前置條件與效果）
   │  ff_planner_handler.py：執行 FF、解析輸出
   ▼
高階計畫 → game_util.get_discrete_hl_action() → 子目標清單（high_pddl）
```

### 3.2 使用的 ALFRED 原始程式

| 檔案 | 作用 |
| --- | --- |
| `gen/goal_library.py` | 每種任務的 PDDL 目標模板，**只描述目標狀態，不描述步驟** |
| `gen/planner/domains/PutTaskExtended_domain.pddl` | 動作定義：GotoLocation、Pickup、Put、Clean、Heat、Cool、Toggle、Slice… |
| `gen/ff_planner/` | Metric-FF 規劃器（C 程式） |
| `gen/planner/ff_planner_handler.py` | 呼叫 FF、把輸出解析成動作 dict |
| `gen/utils/game_util.py` | 轉成 ALFRED 的 `high_pddl` 子目標格式 |

**本研究修改的部分**：用 `alfred_subgoals.py` 取代 `gen/game_states/planned_game_state.py` 的 `state_to_pddl()`，也就是不從 AI2-THOR 模擬器讀狀態，改讀 JSON 場景檔。因此**不需要模擬器，也不需要 GPU**。

### 3.3 子目標種類

ALFRED 評估用的子目標共 8 種：

> GotoLocation、PickupObject、PutObject、CoolObject、HeatObject、CleanObject、SliceObject、ToggleObject

開關門（Open/Close）由低階控制器處理，不會出現在子目標清單裡。

## 4. 環境與安裝

### 4.1 資料夾結構

```
alfred_subgoal/
├── alfred/                      # ALFRED 精簡版（只保留 gen/ 需要的部分）
│   └── gen/
│       ├── goal_library.py
│       ├── constants.py
│       ├── planner/             # domain 與 ff_planner_handler.py
│       ├── utils/
│       └── ff_planner/          # FF 原始碼、build_ff.sh、編譯好的 ff
└── alfred_subgoal_demo/
    ├── alfred_subgoals.py       # 主程式
    ├── setup.sh                 # 一鍵安裝
    ├── README.md
    ├── scenes/
    │   ├── kitchen.json         # ALFRED 7 種任務的測試場景
    │   └── hotel_room.json      # 飯店房間場景
    ├── output/                  # 執行結果
    └── run_log.txt              # 全部任務的輸出紀錄
```

### 4.2 需求

| 項目 | 需求 |
| --- | --- |
| 作業系統 | Linux，或 Windows 上的 WSL（Ubuntu） |
| 編譯器 | gcc、make（已附預先產生的 parser 原始碼，**不需要 flex/bison**） |
| Python | 3.x，加上 numpy、opencv-python-headless（ALFRED `game_util.py` 需要） |

### 4.3 安裝步驟

Windows 先安裝 WSL，在 PowerShell 以系統管理員身分執行：

```powershell
wsl --install
```

重開機後開啟 Ubuntu，進入資料夾執行安裝：

```bash
cd /mnt/c/Users/USER/Desktop/alfred_subgoal/alfred_subgoal_demo
export ALFRED_ROOT=../alfred
bash setup.sh
```

`setup.sh` 會做三件事：

1. 檢查並安裝 gcc 與 Python 套件。
2. 用 `build_ff.sh` 編譯 FF 規劃器。GCC 10 以上必須加 `-fcommon`，否則會出現 `multiple definition of lnum_F`。
3. 跑一個加熱任務範例。

## 5. 執行指令

```bash
export ALFRED_ROOT=../alfred

# (1) 單一任務：把蘋果加熱後放到流理台
python3 alfred_subgoals.py scenes/kitchen.json \
    --task pick_heat_then_place_in_recep --obj Apple --recep CounterTop

# (2) 切片版本
python3 alfred_subgoals.py scenes/kitchen.json \
    --task pick_heat_then_place_in_recep --obj Tomato --recep DiningTable --sliced

# (3) 執行場景檔裡列出的全部任務
python3 alfred_subgoals.py scenes/kitchen.json --all
python3 alfred_subgoals.py scenes/hotel_room.json --all

# (4) 把結果存成紀錄檔
python3 alfred_subgoals.py scenes/hotel_room.json --all > run_log.txt 2>&1
```

| 參數 | 說明 |
| --- | --- |
| `scene` | 場景 JSON 檔路徑（必填） |
| `--task` | 任務類型，來自 `goal_library.py`，例如 `pick_and_place_simple`、`pick_two_obj_and_place` |
| `--obj` | 目標物類別，例如 `Apple` |
| `--recep` | 放置處類別，例如 `CounterTop` |
| `--mrecep` | 可移動容器（`pick_and_place_with_movable_recep` 用） |
| `--toggle` | 要開的燈（`look_at_obj_in_light` 用） |
| `--sliced` | 使用切片版本的目標 |
| `--all` | 執行場景檔 `demo_tasks` 裡的所有任務 |
| `--out` | 輸出資料夾，預設 `output/` |

## 6. 資料格式

整體資料流程：**場景 JSON → PDDL problem → 子目標 JSON**。

### 6.1 輸入：場景檔（`scenes/*.json`）

```json
{
  "agent_start": "loc|0|0|0|30",
  "receptacles": [
    {"id": "Microwave|+01.50|+01.20|-02.00", "type": "Microwave", "loc": "loc|6|-7|2|0"},
    {"id": "DiningTable|-02.00|+00.75|+01.50", "type": "DiningTable", "loc": "loc|-6|5|3|45"}
  ],
  "objects": [
    {"id": "Apple|-02.10|+00.80|+01.40", "type": "Apple", "in": "DiningTable|-02.00|+00.75|+01.50"},
    {"id": "FloorLamp|-03.20|+00.00|+02.00", "type": "FloorLamp", "loc": "loc|-11|7|0|0"}
  ],
  "demo_tasks": [
    {"name": "heat", "task": "pick_heat_then_place_in_recep", "obj": "Apple", "recep": "CounterTop"}
  ]
}
```

| 欄位 | 格式 | 說明 |
| --- | --- | --- |
| `agent_start` | `loc\|x\|z\|方向\|視角` | 代理人起點。x、z 是格點（一格 0.25 m），方向 0–3 代表 0°、90°、180°、270°，視角是俯仰角 |
| `receptacles[].id` | `類別\|x\|y\|z` | ALFRED 的物件 ID 格式 |
| `receptacles[].type` | 字串 | 必須是 ALFRED 類別（`gen/constants.py` 的 `OBJECTS`） |
| `receptacles[].loc` | `loc\|…` | 代理人站著能碰到這個容器的位置 |
| `objects[].in` | 容器 ID | 物體放在哪個容器裡 |
| `objects[].in_object` | 物件 ID | 物體放在可移動容器裡（例如 Mug） |
| `objects[].loc` | `loc\|…` | 不在容器裡的物體（例如落地燈） |
| `demo_tasks` | 陣列 | `--all` 時要執行的任務 |

以下屬性會**依 ALFRED 的 `constants.VAL_ACTION_OBJECTS` 自動加上**，不用手寫：

- 可開關：Fridge、Cabinet、Drawer、Microwave、Safe…
- 可加熱、可冷卻、可清洗、可切片

### 6.2 飯店擴充：多目標歸位（`restore`）

這是本研究新增的，ALFRED 沒有這個任務類型。它把多個「物品 → 標準位置」條件放進**同一個 PDDL 目標**，由規劃器決定整理順序：

```json
{"name": "restore_room", "task": "restore", "goals": [
  {"object_id": "RemoteControl|+00.20|+00.55|+02.10", "recep": "SideTable"},
  {"object_id": "Newspaper|+01.40|+00.65|+02.40",     "recep": "GarbageCan"},
  {"object_id": "Towel|+03.40|+00.45|-03.40",         "recep": "TowelHolder"}
]}
```

### 6.3 中間檔：PDDL problem（`output/problem_<name>.pddl`）

由場景檔自動產生，是送進 FF 規劃器的輸入。ID 裡的特殊符號會照 ALFRED 的規則轉換：`|` 轉成 `_bar_`，`.` 轉成 `_dot_`，`-` 轉成 `_minus_`，`+` 轉成 `_plus_`。

```lisp
(:init
    (= (totalCost) 0)
    (atLocation agent1 loc_bar_0_bar_0_bar_0_bar_30)
    (receptacleType CounterTop_bar__plus_01_dot_00_... CounterTopType)
    (receptacleAtLocation CounterTop_bar__plus_01_dot_00_... loc_bar_4_bar_...)
    (heatable Apple_bar__minus_02_dot_10_...)
    (= (distance loc_A loc_B) 12)            ; 曼哈頓距離 + 1
    ...)
(:goal
    (and
        (exists (?r - receptacle)
            (exists (?o - object)
                (and (heatable ?o) (objectType ?o AppleType)
                     (receptacleType ?r CounterTopType)
                     (isHot ?o) (inReceptacle ?o ?r))))
        (forall (?re - receptacle) (not (opened ?re)))))   ; 結束時所有門都要關上
```

### 6.4 輸出：子目標清單（`output/high_pddl_<name>.json`）

格式和 ALFRED 資料集 `traj_data.json` 裡的 `plan.high_pddl` 相同：

```json
[
  {
    "high_idx": 0,
    "planner_action": {"action": "GotoLocation", "location": "loc|-6|5|3|45"},
    "discrete_action": {"action": "GotoLocation", "args": ["diningtable"]},
    "template_desc": "go to the diningtable"
  },
  {
    "high_idx": 1,
    "planner_action": {
      "action": "PickupObject",
      "objectId": "Apple|-02.10|+00.80|+01.40",
      "receptacleObjectId": "DiningTable|-02.00|+00.75|+01.50"
    },
    "discrete_action": {"action": "PickupObject", "args": ["apple"]},
    "template_desc": "pick up the apple"
  }
]
```

| 欄位 | 說明 |
| --- | --- |
| `high_idx` | 子目標編號，從 0 開始 |
| `planner_action` | 規劃器的原始輸出，包含精確的物件 ID 和位置，**可以直接交給低階控制器執行** |
| `discrete_action` | 簡化格式 `{action, args}`，只留類別名稱，是 ALFRED 模型訓練用的格式 |
| `template_desc` | 模板生成的英文描述 |

## 7. 實驗結果

本地端共執行 13 個任務，**全部成功產生合法計畫**。每個任務的規劃時間都在 1 秒內。

### 7.1 ALFRED 7 種任務類型（`kitchen.json`）

| 任務 | 類型 | 子目標數 | 子目標序列 |
| --- | --- | :-: | --- |
| simple | pick_and_place_simple | 4 | Goto → Pickup → Goto → Put |
| heat | pick_heat_then_place_in_recep | 6 | Goto → Pickup → Goto → Heat → Goto → Put |
| cool | pick_cool_then_place_in_recep | 6 | Goto → Pickup → Goto → Cool → Goto → Put |
| clean | pick_clean_then_place_in_recep | 5 | Goto → Pickup → Clean → Goto → Put |
| two_obj | pick_two_obj_and_place | 8 | Goto → Pickup → Goto → Put → Goto → Pickup → Goto → Put |
| mrecep | pick_and_place_with_movable_recep | 7 | Goto → Pickup → Goto → Put → Pickup → Goto → Put |
| look | look_at_obj_in_light | 4 | Goto → Pickup → Goto → Toggle |
| slice_heat | pick_heat（切片） | 9 | Goto → Pickup(刀) → Slice → Put(刀) → Pickup → Goto → Heat → Goto → Put |

幾個觀察：

- **clean 只有 5 步**：馬克杯本來就在水槽裡，規劃器省掉了一次移動。
- **mrecep**：先把鉛筆放進馬克杯，再把整個杯子搬到架子上。
- **slice_heat**：規劃器自動插入「拿刀 → 切 → 放下刀」這三步。

### 7.2 飯店房間（`hotel_room.json`）

| 任務 | 子目標數 | 說明 |
| --- | :-: | --- |
| remote_to_sidetable | 4 | 遙控器從床上歸位到床頭櫃 |
| two_pillows_to_bed | 8 | 沙發和書桌上的兩個枕頭放回床上 |
| book_into_drawer | 4 | 書收進抽屜（開關抽屜由低階處理） |
| **restore_room** | **25** | 7 件物品一次歸位，由規劃器自動排序 |

`restore_room` 由規劃器產生的整理順序：

| 順序 | 物品 | 從 | 到 |
| :-: | --- | --- | --- |
| 1 | 手機 | 沙發 | 床頭櫃 |
| 2 | 報紙 | 床頭櫃 | 垃圾桶 |
| 3 | 枕頭 | 沙發 | 床 |
| 4 | 遙控器 | 床 | 床頭櫃 |
| 5 | 毛巾 | 浴缸 | 毛巾架 |
| 6 | 書 | 床 | 書桌 |
| 7 | 枕頭 | 書桌 | 床 |

規劃器會**順手處理同一位置的物品**。例如把手機放到床頭櫃後，直接拿起旁邊的報紙丟進垃圾桶；把書放到書桌後，直接拿起書桌上的枕頭。這樣就不需要人工排序。

## 8. 發現與限制

1. **需要完整狀態**：古典規劃必須知道所有物品的位置。房間可以事先掃描，但退房後的現況需要感知模組（物件偵測加定位）來產生場景 JSON，這是下一步的重點。
2. **FF 不保證最佳解**：FF 使用 Enforced Hill-Climbing 加 A*，找到的是「好」的解，不一定是最短的。實作上會跑三種搜尋設定（solver 3、4、5），取最短的計畫，和 ALFRED 原本的做法相同。
3. **距離是估計值**：目前用曼哈頓距離 + 1。ALFRED 原本用導航圖的最短路徑，之後可以改成掃描地圖上的實際路徑長度。
4. **子目標裡沒有開關門**：這是 ALFRED 的設計，低階控制器要自己處理門、抽屜的開關。
5. **ALFRED 程式的小問題**：`get_discrete_hl_action()` 在物體本來就在水槽、微波爐或冰箱旁時，Clean/Heat/Cool 的物體參數會變成空字串。本研究已改用手上的物體補上。
6. **只能處理拿取放置類任務**：鋪床、摺毛巾等靈巧操作不在 PDDL 的動作集合裡，需要另外的低階技能。

## 9. 下一步

- [ ] 設計房務專用的 PDDL domain，加入 `ReplenishObject`（補備品）、`DisposeObject`（收垃圾）、「遺留物回報」等動作
- [ ] 定義「標準狀態」格式，並從掃描結果自動產生 `restore` 目標
- [ ] 串接感知：用開放詞彙偵測（Grounding DINO / OWL-ViT + SAM）從巡房影像產生場景 JSON
- [ ] 實作閉環重新規劃：每完成一個子目標就重新感知，失敗時用新狀態重新規劃
- [ ] 距離改用掃描地圖上的實際導航路徑
- [ ] 和 FILM 模板法、LLM 規劃比較子目標正確率與總移動距離

## 參考資料

- Shridhar et al., *ALFRED: A Benchmark for Interpreting Grounded Instructions for Everyday Tasks*, CVPR 2020. https://github.com/askforalfred/alfred
- Min et al., *FILM: Following Instructions in Language with Modular Methods*, ICLR 2022. https://arxiv.org/abs/2110.07342
- Kim et al., *Context-Aware Planning and Environment-Aware Memory for Instruction Following Embodied Agents (CAPEAM)*, ICCV 2023. https://arxiv.org/abs/2308.07241
- Kim et al., *ReALFRED: An Embodied Instruction Following Benchmark in Photo-Realistic Environments*, ECCV 2024. https://github.com/snumprlab/realfred
- Hoffmann, *Metric-FF Planner*. https://fai.cs.uni-saarland.de/hoffmann/metric-ff.html
