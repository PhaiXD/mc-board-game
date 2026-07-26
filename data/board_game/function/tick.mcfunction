# ============================================================
# Board Game — Tick Loop (Cards = Money, Turn-Based)
# ============================================================

# ================================================
# 0) LOBBY: Tag nearby players & show actionbar
# ================================================
tag @a remove sp_near_board
execute as @e[type=interaction,tag=sp_control_btn,limit=1] at @s run tag @a[distance=..10] add sp_near_board

# Lobby idle message
execute if score #game sp_phase matches 0 if score #game sp_countdown matches ..-1 as @a[tag=sp_near_board] run title @s actionbar ["",{"text":"Board Game","color":"gold","bold":true},{"text":" — Click button to start!","color":"gray"}]

# Update text display above the button
execute if score #game sp_phase matches 0 as @e[type=text_display,tag=sp_control_text] run data modify entity @s text set value ["",{"text":"🕹 Click to Start Game!\n","color":"gold","bold":true},{"text":"Players in zone:\n","color":"gray"},{"selector":"@a[tag=sp_near_board]","color":"aqua"}]

# ================================================
# 0B) COUNTDOWN (5 seconds)
# ================================================
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 1.. store result score #current_near sp_temp if entity @a[tag=sp_near_board]

# Cancel if player count changed
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 1.. unless score #current_near sp_temp = #game sp_expected as @a[tag=sp_was_near,tag=!sp_near_board] run title @a actionbar ["",{"selector":"@s","color":"red"},{"text":" left the zone!","color":"gray"}]
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 1.. unless score #current_near sp_temp = #game sp_expected as @a[tag=sp_was_near,tag=!sp_near_board] run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"red"},{"text":" left the zone! Countdown cancelled.","color":"gray"}]

execute if score #game sp_phase matches 0 if score #game sp_countdown matches 1.. unless score #current_near sp_temp = #game sp_expected as @a[tag=!sp_was_near,tag=sp_near_board] run title @a actionbar ["",{"selector":"@s","color":"green"},{"text":" entered the zone!","color":"gray"}]
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 1.. unless score #current_near sp_temp = #game sp_expected as @a[tag=!sp_was_near,tag=sp_near_board] run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"green"},{"text":" entered the zone! Countdown cancelled.","color":"gray"}]

execute if score #game sp_phase matches 0 if score #game sp_countdown matches 1.. unless score #current_near sp_temp = #game sp_expected run scoreboard players set #game sp_countdown -1
execute if score #game sp_phase matches 0 if score #game sp_countdown matches ..-1 if score #game sp_expected matches 1.. run playsound minecraft:block.note_block.bass player @a[tag=sp_near_board] ~ ~ ~ 1.0 0.5
execute if score #game sp_phase matches 0 if score #game sp_countdown matches ..-1 run scoreboard players set #game sp_expected 0

# Decrement
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 1.. run scoreboard players remove #game sp_countdown 1

# Display seconds
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 81..100 run title @a[tag=sp_near_board] actionbar {"text":"Starting in 5...","color":"gold","bold":true}
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 61..80 run title @a[tag=sp_near_board] actionbar {"text":"Starting in 4...","color":"gold","bold":true}
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 41..60 run title @a[tag=sp_near_board] actionbar {"text":"Starting in 3...","color":"yellow","bold":true}
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 21..40 run title @a[tag=sp_near_board] actionbar {"text":"Starting in 2...","color":"yellow","bold":true}
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 1..20 run title @a[tag=sp_near_board] actionbar {"text":"Starting in 1...","color":"red","bold":true}

# Sound on each second
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 80 run playsound minecraft:block.note_block.hat player @a[tag=sp_near_board] ~ ~ ~ 1.0 1.5
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 60 run playsound minecraft:block.note_block.hat player @a[tag=sp_near_board] ~ ~ ~ 1.0 1.5
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 40 run playsound minecraft:block.note_block.hat player @a[tag=sp_near_board] ~ ~ ~ 1.0 1.5
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 20 run playsound minecraft:block.note_block.hat player @a[tag=sp_near_board] ~ ~ ~ 1.0 1.5
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 0 run playsound minecraft:block.note_block.pling player @a[tag=sp_near_board] ~ ~ ~ 1.0 2.0

# Countdown done → Start game!
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 0 run function board_game:start_game

# ================================================
# 1) CONSUME STALE CLICKS (outside play phase)
# ================================================
execute unless score #game sp_phase matches 1 as @e[type=interaction,tag=sp_interact_crypto] if data entity @s interaction run data remove entity @s interaction
execute unless score #game sp_phase matches 1 as @e[type=interaction,tag=sp_interact_estate] if data entity @s interaction run data remove entity @s interaction
execute unless score #game sp_phase matches 1 as @e[type=interaction,tag=sp_interact_startup] if data entity @s interaction run data remove entity @s interaction
execute unless score #game sp_phase matches 1 as @e[type=interaction,tag=sp_interact_tech] if data entity @s interaction run data remove entity @s interaction

# ================================================
# 2) PLAY PHASE: Actionbar
# ================================================

# Show actionbar: Play or Ready
execute if score #game sp_phase matches 1 as @a[tag=sp_player,tag=!sp_ready] run title @s actionbar ["",{"text":"🎯 PLAY CARDS","color":"gold","bold":true},{"text":" — Right-click Pass when ready","color":"white"}]
execute if score #game sp_phase matches 1 as @a[tag=sp_player,tag=sp_ready] run title @s actionbar ["",{"text":"✅ READY","color":"green","bold":true},{"text":" — Waiting for others...","color":"gray"}]

# ================================================
# 3) PLAY PHASE: Card Detection on Zones
# ================================================
execute if score #game sp_phase matches 1 as @e[type=interaction,tag=sp_interact_crypto] if data entity @s interaction at @s run function board_game:detect/crypto
execute if score #game sp_phase matches 1 as @e[type=interaction,tag=sp_interact_estate] if data entity @s interaction at @s run function board_game:detect/estate
execute if score #game sp_phase matches 1 as @e[type=interaction,tag=sp_interact_startup] if data entity @s interaction at @s run function board_game:detect/startup
execute if score #game sp_phase matches 1 as @e[type=interaction,tag=sp_interact_tech] if data entity @s interaction at @s run function board_game:detect/tech

# ================================================
# 4) PLAY PHASE: Ready Detection (carrot_on_a_stick)
# ================================================
execute as @a[tag=sp_player,scores={sp_use_click=1..}] if score #game sp_phase matches 1 run function board_game:toggle_ready
scoreboard players set @a sp_use_click 0

# Check if ALL players are ready
execute if score #game sp_phase matches 1 store result score #ready_count sp_temp if entity @a[tag=sp_player,tag=sp_ready]
execute if score #game sp_phase matches 1 if score #ready_count sp_temp >= #game sp_player_count run scoreboard players operation #check_round sp_temp = #game sp_round
execute if score #game sp_phase matches 1 if score #ready_count sp_temp >= #game sp_player_count run function board_game:resolve

execute if score #ready_count sp_temp >= #game sp_player_count if score #check_round sp_temp matches ..6 run function board_game:start_phase_1
execute if score #ready_count sp_temp >= #game sp_player_count if score #check_round sp_temp matches 7.. run function board_game:end_game
execute if score #ready_count sp_temp >= #game sp_player_count run scoreboard players set #ready_count sp_temp 0

# ================================================
# 5) Update card count sidebar
# ================================================
execute if score #game sp_phase matches 1 as @a[tag=sp_player] store result score @s sp_cards run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}] 0

# ================================================
# 6) CONTROL BUTTON
# ================================================
execute as @e[type=interaction,tag=sp_control_btn] if data entity @s interaction at @s run function board_game:control_advance

# ================================================
# 7) UPDATE PREVIOUS ZONE STATE
# ================================================
tag @a remove sp_was_near
tag @a[tag=sp_near_board] add sp_was_near
