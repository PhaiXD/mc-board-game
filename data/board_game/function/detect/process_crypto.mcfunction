# ============================================================
# Board Game - Process Card on Crypto (Turn-Based)
# ============================================================

# Use sp_temp as flag to detect if a card was played
scoreboard players set @s sp_temp 0

# Detect card value, set flag, update board, THEN clear
# (clear must be AFTER flag set, because clearing removes the mainhand check)

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:3}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:3}] run scoreboard players add #crypto sp_board_crypto 3
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:3}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:3}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:2}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:2}] run scoreboard players add #crypto sp_board_crypto 2
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:2}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:2}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:1}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:1}] run scoreboard players add #crypto sp_board_crypto 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:1}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:1}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:0}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:0}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:0}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-1}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-1}] run scoreboard players remove #crypto sp_board_crypto 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-1}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:-1}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-2}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-2}] run scoreboard players remove #crypto sp_board_crypto 2
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-2}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:-2}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-3}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-3}] run scoreboard players remove #crypto sp_board_crypto 3
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-3}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:-3}] 1

# --- Common actions (only if a card was played) ---
execute if score @s sp_temp matches 1 run scoreboard players add @s sp_played_crypto 1
execute if score @s sp_temp matches 1 run scoreboard players add @s sp_cards_played 1
execute if score @s sp_temp matches 1 run scoreboard players set #game sp_consecutive_passes 0
execute if score @s sp_temp matches 1 run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"gold"},{"text":" played a card on ","color":"gray"},{"text":"Crypto","color":"light_purple","bold":true}]
execute if score @s sp_temp matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0
execute if score @s sp_temp matches 1 run function board_game:advance_turn
