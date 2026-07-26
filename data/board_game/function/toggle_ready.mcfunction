# ============================================================
# Board Game — Toggle Ready
# Player clicks to toggle their ready state
# ============================================================

execute if entity @s[tag=sp_ready] run tag @s add sp_unready_temp
execute if entity @s[tag=sp_ready] run tag @s remove sp_ready

execute unless entity @s[tag=sp_unready_temp] run tag @s add sp_ready

execute if entity @s[tag=sp_ready] run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"gold"},{"text":" is ready!","color":"green"}]
execute if entity @s[tag=sp_ready] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1.0 1.5

execute if entity @s[tag=sp_unready_temp] run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"gold"},{"text":" is no longer ready.","color":"gray"}]
execute if entity @s[tag=sp_unready_temp] run playsound minecraft:block.note_block.hat player @a ~ ~ ~ 1.0 0.8

tag @s remove sp_unready_temp
