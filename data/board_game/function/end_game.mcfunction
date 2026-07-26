# ============================================================
# Board Game — End Game (Cards = Money)
# ============================================================

scoreboard players set #game sp_phase 0
scoreboard players set #game sp_round 0

# Count final cards
execute as @a[tag=sp_player] store result score @s sp_cards run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}] 0

# Game Over
tellraw @a ["",{"text":"═══════════════════════════════","color":"gold","strikethrough":true},{"text":"\n"},{"text":"  🏆 GAME OVER! 🏆","color":"gold","bold":true},{"text":"\n"},{"text":"═══════════════════════════════","color":"gold","strikethrough":true}]

# Find winner (most cards)
scoreboard players set #max sp_temp -1
execute as @a[tag=sp_player] run scoreboard players operation #max sp_temp > @s sp_cards
execute as @a[tag=sp_player] if score @s sp_cards = #max sp_temp run tellraw @a ["",{"text":"  👑 "},{"selector":"@s","color":"gold","bold":true},{"text":" wins with ","color":"gray"},{"score":{"name":"@s","objective":"sp_cards"},"color":"green","bold":true},{"text":" cards!","color":"green"}]

tellraw @a {"text":""}
tellraw @a ["",{"text":"  Click the button to start a new game.","color":"gray"}]

playsound minecraft:ui.toast.challenge_complete player @a ~ ~ ~ 1.0 1.0
title @a[tag=sp_player] title {"text":"🏆 GAME OVER 🏆","color":"gold","bold":true}

# Clean up
execute as @a[tag=sp_player] run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}]
execute as @a[tag=sp_player] run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data~{sp_confirm_btn:true}]
kill @e[type=item_display,tag=sp_chip]
kill @e[type=item_display,tag=sp_played_card]

# Show border lines again
execute as @e[type=block_display,tag=sp_border_line] run data modify entity @s transformation.scale[1] set value 1.0f

# Remove player tags (back to lobby)
tag @a remove sp_player
tag @a remove sp_current_turn
