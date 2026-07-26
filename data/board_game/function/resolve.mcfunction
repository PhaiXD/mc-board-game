# ============================================================
# Board Game — Resolve (Cards = Money)
# Reveal all zones, distribute/take cards
#
# Positive sum → draw 2× played (cards returned + new cards)
# Zero sum    → draw 1× played (cards returned, break even)
# Negative sum → draw 0 (cards lost permanently)
# ============================================================

scoreboard players set #game sp_phase 0

# --- Announce Results ---
tellraw @a ["",{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true},{"text":"\n"},{"text":"  📊 Round Results!","color":"gold","bold":true},{"text":"\n"},{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true}]

tellraw @a ["",{"text":"  ⚡ Crypto: ","color":"light_purple"},{"score":{"name":"#crypto","objective":"sp_board_crypto"},"color":"white","bold":true},{"text":"  |  ","color":"dark_gray"},{"text":"🏠 Estate: ","color":"aqua"},{"score":{"name":"#estate","objective":"sp_board_estate"},"color":"white","bold":true}]
tellraw @a ["",{"text":"  🚀 Startup: ","color":"yellow"},{"score":{"name":"#startup","objective":"sp_board_startup"},"color":"white","bold":true},{"text":"  |  ","color":"dark_gray"},{"text":"💻 Tech: ","color":"green"},{"score":{"name":"#tech","objective":"sp_board_tech"},"color":"white","bold":true}]
tellraw @a {"text":""}

playsound minecraft:entity.experience_orb.pickup player @a[tag=sp_player] ~ ~ ~ 1.0 1.0

# -----------------------------------------------------------
# CRYPTO
# -----------------------------------------------------------
# Positive (≥1): draw 2× played (cards back + bonus)
execute if score #crypto sp_board_crypto matches 1.. as @a[tag=sp_player,scores={sp_played_crypto=1..}] run scoreboard players operation @s sp_draw_count = @s sp_played_crypto
execute if score #crypto sp_board_crypto matches 1.. as @a[tag=sp_player,scores={sp_played_crypto=1..}] run scoreboard players operation @s sp_draw_count += @s sp_played_crypto
execute if score #crypto sp_board_crypto matches 1.. as @a[tag=sp_player,scores={sp_played_crypto=1..}] run function board_game:resolve/draw_cards
execute if score #crypto sp_board_crypto matches 1.. as @a[tag=sp_player,scores={sp_played_crypto=1..}] run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"⚡ Crypto ▲ ","color":"light_purple"},{"text":"Won! +","color":"green","bold":true},{"score":{"name":"@s","objective":"sp_played_crypto"},"color":"green","bold":true},{"text":" cards profit!","color":"green"}]
execute if score #crypto sp_board_crypto matches 1.. as @a[tag=sp_player,scores={sp_played_crypto=1..}] run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2

# Zero (0): draw 1× played (break even, cards returned)
execute if score #crypto sp_board_crypto matches 0 as @a[tag=sp_player,scores={sp_played_crypto=1..}] run scoreboard players operation @s sp_draw_count = @s sp_played_crypto
execute if score #crypto sp_board_crypto matches 0 as @a[tag=sp_player,scores={sp_played_crypto=1..}] run function board_game:resolve/draw_cards
execute if score #crypto sp_board_crypto matches 0 as @a[tag=sp_player,scores={sp_played_crypto=1..}] run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"⚡ Crypto — ","color":"light_purple"},{"text":"Break even. Cards returned.","color":"yellow"}]

# Negative (≤-1): cards lost permanently
execute if score #crypto sp_board_crypto matches ..-1 as @a[tag=sp_player,scores={sp_played_crypto=1..}] run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"⚡ Crypto ▼ ","color":"light_purple"},{"text":"Lost ","color":"red"},{"score":{"name":"@s","objective":"sp_played_crypto"},"color":"red","bold":true},{"text":" cards!","color":"red"}]
execute if score #crypto sp_board_crypto matches ..-1 as @a[tag=sp_player,scores={sp_played_crypto=1..}] run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

# -----------------------------------------------------------
# ESTATE
# -----------------------------------------------------------
execute if score #estate sp_board_estate matches 1.. as @a[tag=sp_player,scores={sp_played_estate=1..}] run scoreboard players operation @s sp_draw_count = @s sp_played_estate
execute if score #estate sp_board_estate matches 1.. as @a[tag=sp_player,scores={sp_played_estate=1..}] run scoreboard players operation @s sp_draw_count += @s sp_played_estate
execute if score #estate sp_board_estate matches 1.. as @a[tag=sp_player,scores={sp_played_estate=1..}] run function board_game:resolve/draw_cards
execute if score #estate sp_board_estate matches 1.. as @a[tag=sp_player,scores={sp_played_estate=1..}] run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"🏠 Estate ▲ ","color":"aqua"},{"text":"Won! +","color":"green","bold":true},{"score":{"name":"@s","objective":"sp_played_estate"},"color":"green","bold":true},{"text":" cards profit!","color":"green"}]
execute if score #estate sp_board_estate matches 1.. as @a[tag=sp_player,scores={sp_played_estate=1..}] run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2

execute if score #estate sp_board_estate matches 0 as @a[tag=sp_player,scores={sp_played_estate=1..}] run scoreboard players operation @s sp_draw_count = @s sp_played_estate
execute if score #estate sp_board_estate matches 0 as @a[tag=sp_player,scores={sp_played_estate=1..}] run function board_game:resolve/draw_cards
execute if score #estate sp_board_estate matches 0 as @a[tag=sp_player,scores={sp_played_estate=1..}] run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"🏠 Estate — ","color":"aqua"},{"text":"Break even. Cards returned.","color":"yellow"}]

execute if score #estate sp_board_estate matches ..-1 as @a[tag=sp_player,scores={sp_played_estate=1..}] run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"🏠 Estate ▼ ","color":"aqua"},{"text":"Lost ","color":"red"},{"score":{"name":"@s","objective":"sp_played_estate"},"color":"red","bold":true},{"text":" cards!","color":"red"}]
execute if score #estate sp_board_estate matches ..-1 as @a[tag=sp_player,scores={sp_played_estate=1..}] run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

# -----------------------------------------------------------
# STARTUP
# -----------------------------------------------------------
execute if score #startup sp_board_startup matches 1.. as @a[tag=sp_player,scores={sp_played_startup=1..}] run scoreboard players operation @s sp_draw_count = @s sp_played_startup
execute if score #startup sp_board_startup matches 1.. as @a[tag=sp_player,scores={sp_played_startup=1..}] run scoreboard players operation @s sp_draw_count += @s sp_played_startup
execute if score #startup sp_board_startup matches 1.. as @a[tag=sp_player,scores={sp_played_startup=1..}] run function board_game:resolve/draw_cards
execute if score #startup sp_board_startup matches 1.. as @a[tag=sp_player,scores={sp_played_startup=1..}] run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"🚀 Startup ▲ ","color":"yellow"},{"text":"Won! +","color":"green","bold":true},{"score":{"name":"@s","objective":"sp_played_startup"},"color":"green","bold":true},{"text":" cards profit!","color":"green"}]
execute if score #startup sp_board_startup matches 1.. as @a[tag=sp_player,scores={sp_played_startup=1..}] run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2

execute if score #startup sp_board_startup matches 0 as @a[tag=sp_player,scores={sp_played_startup=1..}] run scoreboard players operation @s sp_draw_count = @s sp_played_startup
execute if score #startup sp_board_startup matches 0 as @a[tag=sp_player,scores={sp_played_startup=1..}] run function board_game:resolve/draw_cards
execute if score #startup sp_board_startup matches 0 as @a[tag=sp_player,scores={sp_played_startup=1..}] run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"🚀 Startup — ","color":"yellow"},{"text":"Break even. Cards returned.","color":"yellow"}]

execute if score #startup sp_board_startup matches ..-1 as @a[tag=sp_player,scores={sp_played_startup=1..}] run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"🚀 Startup ▼ ","color":"yellow"},{"text":"Lost ","color":"red"},{"score":{"name":"@s","objective":"sp_played_startup"},"color":"red","bold":true},{"text":" cards!","color":"red"}]
execute if score #startup sp_board_startup matches ..-1 as @a[tag=sp_player,scores={sp_played_startup=1..}] run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

# -----------------------------------------------------------
# TECH
# -----------------------------------------------------------
execute if score #tech sp_board_tech matches 1.. as @a[tag=sp_player,scores={sp_played_tech=1..}] run scoreboard players operation @s sp_draw_count = @s sp_played_tech
execute if score #tech sp_board_tech matches 1.. as @a[tag=sp_player,scores={sp_played_tech=1..}] run scoreboard players operation @s sp_draw_count += @s sp_played_tech
execute if score #tech sp_board_tech matches 1.. as @a[tag=sp_player,scores={sp_played_tech=1..}] run function board_game:resolve/draw_cards
execute if score #tech sp_board_tech matches 1.. as @a[tag=sp_player,scores={sp_played_tech=1..}] run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"💻 Tech ▲ ","color":"green"},{"text":"Won! +","color":"green","bold":true},{"score":{"name":"@s","objective":"sp_played_tech"},"color":"green","bold":true},{"text":" cards profit!","color":"green"}]
execute if score #tech sp_board_tech matches 1.. as @a[tag=sp_player,scores={sp_played_tech=1..}] run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2

execute if score #tech sp_board_tech matches 0 as @a[tag=sp_player,scores={sp_played_tech=1..}] run scoreboard players operation @s sp_draw_count = @s sp_played_tech
execute if score #tech sp_board_tech matches 0 as @a[tag=sp_player,scores={sp_played_tech=1..}] run function board_game:resolve/draw_cards
execute if score #tech sp_board_tech matches 0 as @a[tag=sp_player,scores={sp_played_tech=1..}] run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"💻 Tech — ","color":"green"},{"text":"Break even. Cards returned.","color":"yellow"}]

execute if score #tech sp_board_tech matches ..-1 as @a[tag=sp_player,scores={sp_played_tech=1..}] run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"💻 Tech ▼ ","color":"green"},{"text":"Lost ","color":"red"},{"score":{"name":"@s","objective":"sp_played_tech"},"color":"red","bold":true},{"text":" cards!","color":"red"}]
execute if score #tech sp_board_tech matches ..-1 as @a[tag=sp_player,scores={sp_played_tech=1..}] run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

# --- Update card count ---
execute as @a[tag=sp_player] store result score @s sp_cards run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}] 0

# --- Clean up card displays ---
kill @e[type=item_display,tag=sp_played_card]

# --- Announce end ---
tellraw @a ["",{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true}]
