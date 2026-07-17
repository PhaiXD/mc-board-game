# ============================================================
# Board Game - Process Card on Crypto (Hidden values!)
# ============================================================

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:3}] run scoreboard players add #crypto sp_board_crypto 3
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:3}] run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"gold"},{"text":" played a card on ","color":"gray"},{"text":"Crypto","color":"light_purple","bold":true}]
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:3}] run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:3}] run scoreboard players add @s sp_cards_played 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:3}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:3}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:2}] run scoreboard players add #crypto sp_board_crypto 2
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:2}] run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"gold"},{"text":" played a card on ","color":"gray"},{"text":"Crypto","color":"light_purple","bold":true}]
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:2}] run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:2}] run scoreboard players add @s sp_cards_played 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:2}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:2}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:1}] run scoreboard players add #crypto sp_board_crypto 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:1}] run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"gold"},{"text":" played a card on ","color":"gray"},{"text":"Crypto","color":"light_purple","bold":true}]
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:1}] run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:1}] run scoreboard players add @s sp_cards_played 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:1}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:1}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:0}] run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"gold"},{"text":" played a card on ","color":"gray"},{"text":"Crypto","color":"light_purple","bold":true}]
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:0}] run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:0}] run scoreboard players add @s sp_cards_played 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:0}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:0}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-1}] run scoreboard players remove #crypto sp_board_crypto 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-1}] run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"gold"},{"text":" played a card on ","color":"gray"},{"text":"Crypto","color":"light_purple","bold":true}]
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-1}] run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-1}] run scoreboard players add @s sp_cards_played 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-1}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:-1}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-2}] run scoreboard players remove #crypto sp_board_crypto 2
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-2}] run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"gold"},{"text":" played a card on ","color":"gray"},{"text":"Crypto","color":"light_purple","bold":true}]
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-2}] run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-2}] run scoreboard players add @s sp_cards_played 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-2}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:-2}] 1

execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-3}] run scoreboard players remove #crypto sp_board_crypto 3
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-3}] run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"gold"},{"text":" played a card on ","color":"gray"},{"text":"Crypto","color":"light_purple","bold":true}]
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-3}] run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~ 1.0 1.0
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-3}] run scoreboard players add @s sp_cards_played 1
execute if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_value:-3}] run clear @s minecraft:paper[minecraft:custom_data~{sp_value:-3}] 1
