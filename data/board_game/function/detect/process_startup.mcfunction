# ============================================================
# Board Game - Process Card on Startup (Turn-Based)
# ============================================================

scoreboard players set @s sp_temp 0

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:3}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:3}] run scoreboard players add #startup sp_board_startup 3
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:3}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:3}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:2}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:2}] run scoreboard players add #startup sp_board_startup 2
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:2}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:2}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:1}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:1}] run scoreboard players add #startup sp_board_startup 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:1}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:1}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:0}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:0}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:0}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-1}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-1}] run scoreboard players remove #startup sp_board_startup 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-1}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:-1}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-2}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-2}] run scoreboard players remove #startup sp_board_startup 2
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-2}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:-2}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-3}] run scoreboard players set @s sp_temp 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-3}] run scoreboard players remove #startup sp_board_startup 3
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-3}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:-3}] 1

# --- Common actions ---
execute if score @s sp_temp matches 1 run scoreboard players add @s sp_played_startup 1
execute if score @s sp_temp matches 1 run scoreboard players add @s sp_cards_played 1
execute if score @s sp_temp matches 1 run scoreboard players set #game sp_consecutive_passes 0
execute if score @s sp_temp matches 1 run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"gold"},{"text":" played a card on ","color":"gray"},{"text":"Startup","color":"yellow","bold":true}]
execute if score @s sp_temp matches 1 run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0
execute if score @s sp_temp matches 1 run function board_game:advance_turn
