# ============================================================
# Board Game — Resolve Bets
# Runs as each player in Phase 3
# For positive index: payout = bet + (bet * index)
# For zero index: refund = bet (return original)
# For negative index: loss = bet is gone
# ============================================================

# -----------------------------------------------------------
# CRYPTO
# -----------------------------------------------------------
# Loss (index < 0): money is gone
execute if score #crypto sp_board_crypto matches ..-1 if score @s sp_bet_crypto matches 1.. run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"Lost ","color":"red"},{"score":{"name":"@s","objective":"sp_bet_crypto"},"color":"gold","bold":true},{"text":"M in Crypto.","color":"light_purple"}]
execute if score #crypto sp_board_crypto matches ..-1 if score @s sp_bet_crypto matches 1.. run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

# Refund (index == 0): return original bet
execute if score #crypto sp_board_crypto matches 0 if score @s sp_bet_crypto matches 1.. run scoreboard players operation @s sp_payout = @s sp_bet_crypto
execute if score #crypto sp_board_crypto matches 0 if score @s sp_bet_crypto matches 1.. store result storage board_game:macro payout int 1 run scoreboard players get @s sp_payout
execute if score #crypto sp_board_crypto matches 0 if score @s sp_bet_crypto matches 1.. run data modify storage board_game:macro project set value "\"Crypto\""
execute if score #crypto sp_board_crypto matches 0 if score @s sp_bet_crypto matches 1.. run data modify storage board_game:macro color set value "\"light_purple\""
execute if score #crypto sp_board_crypto matches 0 if score @s sp_bet_crypto matches 1.. run function board_game:resolve/give_refund with storage board_game:macro

# Profit (index > 0): payout = bet + (bet * index)
execute if score #crypto sp_board_crypto matches 1.. if score @s sp_bet_crypto matches 1.. run scoreboard players operation @s sp_calc = @s sp_bet_crypto
execute if score #crypto sp_board_crypto matches 1.. if score @s sp_bet_crypto matches 1.. run scoreboard players operation @s sp_calc *= #crypto sp_board_crypto
execute if score #crypto sp_board_crypto matches 1.. if score @s sp_bet_crypto matches 1.. run scoreboard players operation @s sp_payout = @s sp_bet_crypto
execute if score #crypto sp_board_crypto matches 1.. if score @s sp_bet_crypto matches 1.. run scoreboard players operation @s sp_payout += @s sp_calc
execute if score #crypto sp_board_crypto matches 1.. if score @s sp_bet_crypto matches 1.. store result storage board_game:macro payout int 1 run scoreboard players get @s sp_payout
execute if score #crypto sp_board_crypto matches 1.. if score @s sp_bet_crypto matches 1.. run data modify storage board_game:macro project set value "\"Crypto\""
execute if score #crypto sp_board_crypto matches 1.. if score @s sp_bet_crypto matches 1.. run data modify storage board_game:macro color set value "\"light_purple\""
execute if score #crypto sp_board_crypto matches 1.. if score @s sp_bet_crypto matches 1.. run function board_game:resolve/give_profit with storage board_game:macro

# -----------------------------------------------------------
# ESTATE
# -----------------------------------------------------------
execute if score #estate sp_board_estate matches ..-1 if score @s sp_bet_estate matches 1.. run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"Lost ","color":"red"},{"score":{"name":"@s","objective":"sp_bet_estate"},"color":"gold","bold":true},{"text":"M in Estate.","color":"aqua"}]
execute if score #estate sp_board_estate matches ..-1 if score @s sp_bet_estate matches 1.. run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

execute if score #estate sp_board_estate matches 0 if score @s sp_bet_estate matches 1.. run scoreboard players operation @s sp_payout = @s sp_bet_estate
execute if score #estate sp_board_estate matches 0 if score @s sp_bet_estate matches 1.. store result storage board_game:macro payout int 1 run scoreboard players get @s sp_payout
execute if score #estate sp_board_estate matches 0 if score @s sp_bet_estate matches 1.. run data modify storage board_game:macro project set value "\"Estate\""
execute if score #estate sp_board_estate matches 0 if score @s sp_bet_estate matches 1.. run data modify storage board_game:macro color set value "\"aqua\""
execute if score #estate sp_board_estate matches 0 if score @s sp_bet_estate matches 1.. run function board_game:resolve/give_refund with storage board_game:macro

execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. run scoreboard players operation @s sp_calc = @s sp_bet_estate
execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. run scoreboard players operation @s sp_calc *= #estate sp_board_estate
execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. run scoreboard players operation @s sp_payout = @s sp_bet_estate
execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. run scoreboard players operation @s sp_payout += @s sp_calc
execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. store result storage board_game:macro payout int 1 run scoreboard players get @s sp_payout
execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. run data modify storage board_game:macro project set value "\"Estate\""
execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. run data modify storage board_game:macro color set value "\"aqua\""
execute if score #estate sp_board_estate matches 1.. if score @s sp_bet_estate matches 1.. run function board_game:resolve/give_profit with storage board_game:macro

# -----------------------------------------------------------
# STARTUP
# -----------------------------------------------------------
execute if score #startup sp_board_startup matches ..-1 if score @s sp_bet_startup matches 1.. run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"Lost ","color":"red"},{"score":{"name":"@s","objective":"sp_bet_startup"},"color":"gold","bold":true},{"text":"M in Startup.","color":"yellow"}]
execute if score #startup sp_board_startup matches ..-1 if score @s sp_bet_startup matches 1.. run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

execute if score #startup sp_board_startup matches 0 if score @s sp_bet_startup matches 1.. run scoreboard players operation @s sp_payout = @s sp_bet_startup
execute if score #startup sp_board_startup matches 0 if score @s sp_bet_startup matches 1.. store result storage board_game:macro payout int 1 run scoreboard players get @s sp_payout
execute if score #startup sp_board_startup matches 0 if score @s sp_bet_startup matches 1.. run data modify storage board_game:macro project set value "\"Startup\""
execute if score #startup sp_board_startup matches 0 if score @s sp_bet_startup matches 1.. run data modify storage board_game:macro color set value "\"yellow\""
execute if score #startup sp_board_startup matches 0 if score @s sp_bet_startup matches 1.. run function board_game:resolve/give_refund with storage board_game:macro

execute if score #startup sp_board_startup matches 1.. if score @s sp_bet_startup matches 1.. run scoreboard players operation @s sp_calc = @s sp_bet_startup
execute if score #startup sp_board_startup matches 1.. if score @s sp_bet_startup matches 1.. run scoreboard players operation @s sp_calc *= #startup sp_board_startup
execute if score #startup sp_board_startup matches 1.. if score @s sp_bet_startup matches 1.. run scoreboard players operation @s sp_payout = @s sp_bet_startup
execute if score #startup sp_board_startup matches 1.. if score @s sp_bet_startup matches 1.. run scoreboard players operation @s sp_payout += @s sp_calc
execute if score #startup sp_board_startup matches 1.. if score @s sp_bet_startup matches 1.. store result storage board_game:macro payout int 1 run scoreboard players get @s sp_payout
execute if score #startup sp_board_startup matches 1.. if score @s sp_bet_startup matches 1.. run data modify storage board_game:macro project set value "\"Startup\""
execute if score #startup sp_board_startup matches 1.. if score @s sp_bet_startup matches 1.. run data modify storage board_game:macro color set value "\"yellow\""
execute if score #startup sp_board_startup matches 1.. if score @s sp_bet_startup matches 1.. run function board_game:resolve/give_profit with storage board_game:macro

# -----------------------------------------------------------
# TECH
# -----------------------------------------------------------
execute if score #tech sp_board_tech matches ..-1 if score @s sp_bet_tech matches 1.. run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"Lost ","color":"red"},{"score":{"name":"@s","objective":"sp_bet_tech"},"color":"gold","bold":true},{"text":"M in Tech.","color":"green"}]
execute if score #tech sp_board_tech matches ..-1 if score @s sp_bet_tech matches 1.. run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

execute if score #tech sp_board_tech matches 0 if score @s sp_bet_tech matches 1.. run scoreboard players operation @s sp_payout = @s sp_bet_tech
execute if score #tech sp_board_tech matches 0 if score @s sp_bet_tech matches 1.. store result storage board_game:macro payout int 1 run scoreboard players get @s sp_payout
execute if score #tech sp_board_tech matches 0 if score @s sp_bet_tech matches 1.. run data modify storage board_game:macro project set value "\"Tech\""
execute if score #tech sp_board_tech matches 0 if score @s sp_bet_tech matches 1.. run data modify storage board_game:macro color set value "\"green\""
execute if score #tech sp_board_tech matches 0 if score @s sp_bet_tech matches 1.. run function board_game:resolve/give_refund with storage board_game:macro

execute if score #tech sp_board_tech matches 1.. if score @s sp_bet_tech matches 1.. run scoreboard players operation @s sp_calc = @s sp_bet_tech
execute if score #tech sp_board_tech matches 1.. if score @s sp_bet_tech matches 1.. run scoreboard players operation @s sp_calc *= #tech sp_board_tech
execute if score #tech sp_board_tech matches 1.. if score @s sp_bet_tech matches 1.. run scoreboard players operation @s sp_payout = @s sp_bet_tech
execute if score #tech sp_board_tech matches 1.. if score @s sp_bet_tech matches 1.. run scoreboard players operation @s sp_payout += @s sp_calc
execute if score #tech sp_board_tech matches 1.. if score @s sp_bet_tech matches 1.. store result storage board_game:macro payout int 1 run scoreboard players get @s sp_payout
execute if score #tech sp_board_tech matches 1.. if score @s sp_bet_tech matches 1.. run data modify storage board_game:macro project set value "\"Tech\""
execute if score #tech sp_board_tech matches 1.. if score @s sp_bet_tech matches 1.. run data modify storage board_game:macro color set value "\"green\""
execute if score #tech sp_board_tech matches 1.. if score @s sp_bet_tech matches 1.. run function board_game:resolve/give_profit with storage board_game:macro

# Update sidebar
execute store result score @s sp_money run clear @s minecraft:gold_nugget[minecraft:custom_data~{sp_money:true}] 0
