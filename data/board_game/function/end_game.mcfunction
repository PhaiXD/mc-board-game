# ============================================================
# Board Game — End Game
# ============================================================

scoreboard players set #game sp_phase 0
scoreboard players set #game sp_round 0

# Clear game items
execute as @a[tag=sp_player] run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}]
execute as @a[tag=sp_player] run clear @s minecraft:red_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
execute as @a[tag=sp_player] run clear @s minecraft:gray_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
execute as @a[tag=sp_player] run clear @s minecraft:purple_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
execute as @a[tag=sp_player] run clear @s minecraft:light_blue_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
execute as @a[tag=sp_player] run clear @s minecraft:yellow_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
execute as @a[tag=sp_player] run clear @s minecraft:lime_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
execute as @a[tag=sp_player] run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data~{sp_confirm_btn:true}]

# Update money one last time (count nuggets and diamonds)
execute as @a[tag=sp_player] run function board_game:update_money


# Clear all money
execute as @a[tag=sp_player] run clear @s minecraft:gold_nugget[minecraft:custom_data~{sp_money:true}]
execute as @a[tag=sp_player] run clear @s minecraft:diamond[minecraft:custom_data~{sp_money:true}]

# Game Over
tellraw @a ["",{"text":"═══════════════════════════════","color":"gold","strikethrough":true},{"text":"\n"},{"text":"  🏆 GAME OVER! 🏆","color":"gold","bold":true},{"text":"\n"},{"text":"═══════════════════════════════","color":"gold","strikethrough":true}]

# Find winner
scoreboard players set #max sp_temp -999999
execute as @a[tag=sp_player] run scoreboard players operation #max sp_temp > @s sp_money
execute as @a[tag=sp_player] if score @s sp_money = #max sp_temp run tellraw @a ["",{"text":"  👑 ","color":"yellow"},{"selector":"@s","color":"gold","bold":true},{"text":" wins with ","color":"gray"},{"score":{"name":"@s","objective":"sp_money"},"color":"green","bold":true},{"text":"M!","color":"green"}]

tellraw @a {"text":""}
tellraw @a ["",{"text":"  Click the button to start a new game.","color":"gray"}]

playsound minecraft:ui.toast.challenge_complete player @a ~ ~ ~ 1.0 1.0
title @a[tag=sp_player] title {"text":"🏆 GAME OVER 🏆","color":"gold","bold":true}

# Clean up
kill @e[type=item_display,tag=sp_chip]
kill @e[type=item_display,tag=sp_played_card]

# Show border lines again
execute as @e[type=block_display,tag=sp_border_line] run data modify entity @s transformation.scale[1] set value 1.0f

# Remove player tags (back to lobby)
tag @a remove sp_player
