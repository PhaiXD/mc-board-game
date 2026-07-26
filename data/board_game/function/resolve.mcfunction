# ============================================================
# Board Game — Resolve Bets (Multiplier Table)
# Runs as each player after Phase 2
#
# Multiplier table (payout = bet * multiplier):
#   sum   | estate | tech | startup | crypto
#   ≤ -3  |  ×0    |  ×0  |   ×0    |  ×0
#    -2   |  ×1    |  ×0  |   ×0    |  ×0
#    -1   |  ×1    |  ×0  |   ×0    |  ×0
#     0   |  ×1    |  ×1  |   ×1    |  ×1
#     1   |  ×2    |  ×2  |   ×2    |  ×2
#     2   |  ×2    |  ×2  |   ×2    |  ×3
#    ≥ 3  |  ×2    |  ×3  |   ×4    |  ×5
# ============================================================

# -----------------------------------------------------------
# CRYPTO  (safe zone: only 0, volatile: ×5 at ≥3)
# -----------------------------------------------------------
# ×0 (loss): sum ≤ -1
execute if score #crypto sp_board_crypto matches ..-1 if score @s sp_bet_crypto matches 1.. run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"Lost ","color":"red"},{"score":{"name":"@s","objective":"sp_bet_crypto"},"color":"gold","bold":true},{"text":"M in Crypto.","color":"light_purple"}]
execute if score #crypto sp_board_crypto matches ..-1 if score @s sp_bet_crypto matches 1.. run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

# ×1 (refund): sum == 0
execute if score #crypto sp_board_crypto matches 0 if score @s sp_bet_crypto matches 1.. run scoreboard players operation @s sp_payout = @s sp_bet_crypto
execute if score #crypto sp_board_crypto matches 0 if score @s sp_bet_crypto matches 1.. run data modify storage board_game:macro project set value "\"Crypto\""
execute if score #crypto sp_board_crypto matches 0 if score @s sp_bet_crypto matches 1.. run data modify storage board_game:macro color set value "\"light_purple\""
execute if score #crypto sp_board_crypto matches 0 if score @s sp_bet_crypto matches 1.. run function board_game:resolve/give_refund

# ×2: sum == 1
execute if score #crypto sp_board_crypto matches 1 if score @s sp_bet_crypto matches 1.. run scoreboard players set @s sp_payout 2
execute if score #crypto sp_board_crypto matches 1 if score @s sp_bet_crypto matches 1.. run scoreboard players operation @s sp_payout *= @s sp_bet_crypto
execute if score #crypto sp_board_crypto matches 1 if score @s sp_bet_crypto matches 1.. run data modify storage board_game:macro project set value "\"Crypto\""
execute if score #crypto sp_board_crypto matches 1 if score @s sp_bet_crypto matches 1.. run data modify storage board_game:macro color set value "\"light_purple\""
execute if score #crypto sp_board_crypto matches 1 if score @s sp_bet_crypto matches 1.. run function board_game:resolve/give_profit

# ×3: sum == 2
execute if score #crypto sp_board_crypto matches 2 if score @s sp_bet_crypto matches 1.. run scoreboard players set @s sp_payout 3
execute if score #crypto sp_board_crypto matches 2 if score @s sp_bet_crypto matches 1.. run scoreboard players operation @s sp_payout *= @s sp_bet_crypto
execute if score #crypto sp_board_crypto matches 2 if score @s sp_bet_crypto matches 1.. run data modify storage board_game:macro project set value "\"Crypto\""
execute if score #crypto sp_board_crypto matches 2 if score @s sp_bet_crypto matches 1.. run data modify storage board_game:macro color set value "\"light_purple\""
execute if score #crypto sp_board_crypto matches 2 if score @s sp_bet_crypto matches 1.. run function board_game:resolve/give_profit

# ×5: sum ≥ 3
execute if score #crypto sp_board_crypto matches 3.. if score @s sp_bet_crypto matches 1.. run scoreboard players set @s sp_payout 5
execute if score #crypto sp_board_crypto matches 3.. if score @s sp_bet_crypto matches 1.. run scoreboard players operation @s sp_payout *= @s sp_bet_crypto
execute if score #crypto sp_board_crypto matches 3.. if score @s sp_bet_crypto matches 1.. run data modify storage board_game:macro project set value "\"Crypto\""
execute if score #crypto sp_board_crypto matches 3.. if score @s sp_bet_crypto matches 1.. run data modify storage board_game:macro color set value "\"light_purple\""
execute if score #crypto sp_board_crypto matches 3.. if score @s sp_bet_crypto matches 1.. run function board_game:resolve/give_profit

# -----------------------------------------------------------
# ESTATE  (safe: ×1 at -2..-1, cap ×2)
# -----------------------------------------------------------
# ×0 (loss): sum ≤ -3
execute if score #estate sp_board_estate matches ..-3 if score @s sp_bet_estate matches 1.. run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"Lost ","color":"red"},{"score":{"name":"@s","objective":"sp_bet_estate"},"color":"gold","bold":true},{"text":"M in Estate.","color":"aqua"}]
execute if score #estate sp_board_estate matches ..-3 if score @s sp_bet_estate matches 1.. run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

# ×1 (refund): sum -2..0
execute if score #estate sp_board_estate matches -2..0 if score @s sp_bet_estate matches 1.. run scoreboard players operation @s sp_payout = @s sp_bet_estate
execute if score #estate sp_board_estate matches -2..0 if score @s sp_bet_estate matches 1.. run data modify storage board_game:macro project set value "\"Estate\""
execute if score #estate sp_board_estate matches -2..0 if score @s sp_bet_estate matches 1.. run data modify storage board_game:macro color set value "\"aqua\""
execute if score #estate sp_board_estate matches -2..0 if score @s sp_bet_estate matches 1.. run function board_game:resolve/give_refund

# ×2: sum ≥ 1
execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. run scoreboard players set @s sp_payout 2
execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. run scoreboard players operation @s sp_payout *= @s sp_bet_estate
execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. run data modify storage board_game:macro project set value "\"Estate\""
execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. run data modify storage board_game:macro color set value "\"aqua\""
execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. run function board_game:resolve/give_profit

# -----------------------------------------------------------
# STARTUP  (risky: ×0 at -1, cap ×4)
# -----------------------------------------------------------
# ×0 (loss): sum ≤ -1
execute if score #startup sp_board_startup matches ..-1 if score @s sp_bet_startup matches 1.. run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"Lost ","color":"red"},{"score":{"name":"@s","objective":"sp_bet_startup"},"color":"gold","bold":true},{"text":"M in Startup.","color":"yellow"}]
execute if score #startup sp_board_startup matches ..-1 if score @s sp_bet_startup matches 1.. run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

# ×1 (refund): sum == 0
execute if score #startup sp_board_startup matches 0 if score @s sp_bet_startup matches 1.. run scoreboard players operation @s sp_payout = @s sp_bet_startup
execute if score #startup sp_board_startup matches 0 if score @s sp_bet_startup matches 1.. run data modify storage board_game:macro project set value "\"Startup\""
execute if score #startup sp_board_startup matches 0 if score @s sp_bet_startup matches 1.. run data modify storage board_game:macro color set value "\"yellow\""
execute if score #startup sp_board_startup matches 0 if score @s sp_bet_startup matches 1.. run function board_game:resolve/give_refund

# ×2: sum == 1..2
execute if score #startup sp_board_startup matches 1..2 if score @s sp_bet_startup matches 1.. run scoreboard players set @s sp_payout 2
execute if score #startup sp_board_startup matches 1..2 if score @s sp_bet_startup matches 1.. run scoreboard players operation @s sp_payout *= @s sp_bet_startup
execute if score #startup sp_board_startup matches 1..2 if score @s sp_bet_startup matches 1.. run data modify storage board_game:macro project set value "\"Startup\""
execute if score #startup sp_board_startup matches 1..2 if score @s sp_bet_startup matches 1.. run data modify storage board_game:macro color set value "\"yellow\""
execute if score #startup sp_board_startup matches 1..2 if score @s sp_bet_startup matches 1.. run function board_game:resolve/give_profit

# ×4: sum ≥ 3
execute if score #startup sp_board_startup matches 3.. if score @s sp_bet_startup matches 1.. run scoreboard players set @s sp_payout 4
execute if score #startup sp_board_startup matches 3.. if score @s sp_bet_startup matches 1.. run scoreboard players operation @s sp_payout *= @s sp_bet_startup
execute if score #startup sp_board_startup matches 3.. if score @s sp_bet_startup matches 1.. run data modify storage board_game:macro project set value "\"Startup\""
execute if score #startup sp_board_startup matches 3.. if score @s sp_bet_startup matches 1.. run data modify storage board_game:macro color set value "\"yellow\""
execute if score #startup sp_board_startup matches 3.. if score @s sp_bet_startup matches 1.. run function board_game:resolve/give_profit

# -----------------------------------------------------------
# TECH  (balanced: ×0 at -1, cap ×3)
# -----------------------------------------------------------
# ×0 (loss): sum ≤ -1
execute if score #tech sp_board_tech matches ..-1 if score @s sp_bet_tech matches 1.. run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"Lost ","color":"red"},{"score":{"name":"@s","objective":"sp_bet_tech"},"color":"gold","bold":true},{"text":"M in Tech.","color":"green"}]
execute if score #tech sp_board_tech matches ..-1 if score @s sp_bet_tech matches 1.. run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

# ×1 (refund): sum == 0
execute if score #tech sp_board_tech matches 0 if score @s sp_bet_tech matches 1.. run scoreboard players operation @s sp_payout = @s sp_bet_tech
execute if score #tech sp_board_tech matches 0 if score @s sp_bet_tech matches 1.. run data modify storage board_game:macro project set value "\"Tech\""
execute if score #tech sp_board_tech matches 0 if score @s sp_bet_tech matches 1.. run data modify storage board_game:macro color set value "\"green\""
execute if score #tech sp_board_tech matches 0 if score @s sp_bet_tech matches 1.. run function board_game:resolve/give_refund

# ×2: sum == 1..2
execute if score #tech sp_board_tech matches 1..2 if score @s sp_bet_tech matches 1.. run scoreboard players set @s sp_payout 2
execute if score #tech sp_board_tech matches 1..2 if score @s sp_bet_tech matches 1.. run scoreboard players operation @s sp_payout *= @s sp_bet_tech
execute if score #tech sp_board_tech matches 1..2 if score @s sp_bet_tech matches 1.. run data modify storage board_game:macro project set value "\"Tech\""
execute if score #tech sp_board_tech matches 1..2 if score @s sp_bet_tech matches 1.. run data modify storage board_game:macro color set value "\"green\""
execute if score #tech sp_board_tech matches 1..2 if score @s sp_bet_tech matches 1.. run function board_game:resolve/give_profit

# ×3: sum ≥ 3
execute if score #tech sp_board_tech matches 3.. if score @s sp_bet_tech matches 1.. run scoreboard players set @s sp_payout 3
execute if score #tech sp_board_tech matches 3.. if score @s sp_bet_tech matches 1.. run scoreboard players operation @s sp_payout *= @s sp_bet_tech
execute if score #tech sp_board_tech matches 3.. if score @s sp_bet_tech matches 1.. run data modify storage board_game:macro project set value "\"Tech\""
execute if score #tech sp_board_tech matches 3.. if score @s sp_bet_tech matches 1.. run data modify storage board_game:macro color set value "\"green\""
execute if score #tech sp_board_tech matches 3.. if score @s sp_bet_tech matches 1.. run function board_game:resolve/give_profit
