# ============================================================
# Board Game — Tick Loop
# ============================================================

# ================================================
# 0) LOBBY: Tag nearby players & show actionbar
# ================================================
tag @a remove sp_near_board
execute as @e[type=interaction,tag=sp_control_btn,limit=1] at @s run tag @a[distance=..10] add sp_near_board

# Lobby idle message & particles
execute if score #game sp_phase matches 0 if score #game sp_countdown matches ..-1 as @a[tag=sp_near_board] run title @s actionbar ["",{"text":"Board Game","color":"gold","bold":true},{"text":" — Click button to start!","color":"gray"}]

# Update text display above the button with current players
execute if score #game sp_phase matches 0 as @e[type=text_display,tag=sp_control_text] run data modify entity @s text set value ["",{"text":"🕹 Click to Start Game!\n","color":"gold","bold":true},{"text":"Players in zone:\n","color":"gray"},{"selector":"@a[tag=sp_near_board]","color":"aqua"}]

# ================================================
# 0B) COUNTDOWN (5 seconds)
# ================================================
# Check current nearby count
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 1.. store result score #current_near sp_temp if entity @a[tag=sp_near_board]

# Cancel if player count changed
execute if score #game sp_phase matches 0 if score #game sp_countdown matches 1.. unless score #current_near sp_temp = #game sp_expected run scoreboard players set #game sp_countdown -1
execute if score #game sp_phase matches 0 if score #game sp_countdown matches ..-1 if score #game sp_expected matches 1.. run tellraw @a[tag=sp_near_board] ["",{"text":"[BG] ","color":"dark_purple"},{"text":"Player count changed! Press button again.","color":"red"}]
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
# 1) CONSUME STALE CLICKS (exploit: clicking zones outside Phase 2)
# ================================================
execute unless score #game sp_phase matches 2 as @e[type=interaction,tag=sp_interact_crypto] if data entity @s interaction run data remove entity @s interaction
execute unless score #game sp_phase matches 2 as @e[type=interaction,tag=sp_interact_estate] if data entity @s interaction run data remove entity @s interaction
execute unless score #game sp_phase matches 2 as @e[type=interaction,tag=sp_interact_startup] if data entity @s interaction run data remove entity @s interaction
execute unless score #game sp_phase matches 2 as @e[type=interaction,tag=sp_interact_tech] if data entity @s interaction run data remove entity @s interaction

# ================================================
# 2) INVENTORY: Money protection + UI lock
# ================================================
# Count money BEFORE lock (to detect money lost in glass slots)
execute if score #game sp_phase matches 1.. as @a[tag=sp_player] store result score @s sp_temp run clear @s minecraft:gold_nugget[minecraft:custom_data~{sp_money:true}] 0

# Lock inventory slots
execute if score #game sp_phase matches 1.. as @a[tag=sp_player] run function board_game:ui/lock_slots

# Count money AFTER lock
execute if score #game sp_phase matches 1.. as @a[tag=sp_player] store result score @s sp_calc run clear @s minecraft:gold_nugget[minecraft:custom_data~{sp_money:true}] 0

# Refund any money destroyed by lock_slots
execute if score #game sp_phase matches 1.. as @a[tag=sp_player] run scoreboard players operation @s sp_temp -= @s sp_calc
execute if score #game sp_phase matches 1.. as @a[tag=sp_player,scores={sp_temp=1..}] store result storage board_game:refund count int 1 run scoreboard players get @s sp_temp
execute if score #game sp_phase matches 1.. as @a[tag=sp_player,scores={sp_temp=1..}] run function board_game:ui/refund_money with storage board_game:refund

# ================================================
# 3) CONFIRM BUTTON (carrot_on_a_stick at slot 8)
# ================================================
execute as @a[tag=sp_player,scores={sp_use_click=1..}] if score #game sp_phase matches 1..3 run scoreboard players set @s sp_confirm 1
scoreboard players set @a sp_use_click 0

# ================================================
# 4) TRIGGER DETECTION — /trigger sp_confirm
# ================================================
execute as @a[tag=sp_player,scores={sp_confirm=1}] run tellraw @a ["",{"text":"[BG] ","color":"dark_purple","bold":true},{"selector":"@s","color":"gold"},{"text":" is ready! ✓","color":"green"}]
execute as @a[tag=sp_player,scores={sp_confirm=1}] run playsound minecraft:block.note_block.chime player @s ~ ~ ~ 1.0 1.5
execute as @a[tag=sp_player,scores={sp_confirm=1}] run scoreboard players set @s sp_confirm 2

# Enable trigger for all players
scoreboard players enable @a sp_confirm

# ================================================
# 5) AUTO-ADVANCE — when all game players confirmed
# ================================================
execute store result score #total sp_temp if entity @a[tag=sp_player]
execute store result score #ready sp_temp if entity @a[tag=sp_player,scores={sp_confirm=2..}]
scoreboard players operation #phase_snap sp_temp = #game sp_phase

execute if score #phase_snap sp_temp matches 1 if score #total sp_temp matches 1.. if score #ready sp_temp = #total sp_temp run function board_game:start_phase_2
execute if score #phase_snap sp_temp matches 2 if score #total sp_temp matches 1.. if score #ready sp_temp = #total sp_temp run function board_game:start_phase_3
execute if score #phase_snap sp_temp matches 3 if score #total sp_temp matches 1.. if score #ready sp_temp = #total sp_temp if score #game sp_round matches ..6 run function board_game:start_phase_1
execute if score #phase_snap sp_temp matches 3 if score #total sp_temp matches 1.. if score #ready sp_temp = #total sp_temp if score #game sp_round matches 7.. run function board_game:end_game

# ================================================
# 6) PHASE 2: Card detection on zones
# ================================================
execute if score #game sp_phase matches 2 as @e[type=interaction,tag=sp_interact_crypto] if data entity @s interaction at @s run function board_game:detect/crypto
execute if score #game sp_phase matches 2 as @e[type=interaction,tag=sp_interact_estate] if data entity @s interaction at @s run function board_game:detect/estate
execute if score #game sp_phase matches 2 as @e[type=interaction,tag=sp_interact_startup] if data entity @s interaction at @s run function board_game:detect/startup
execute if score #game sp_phase matches 2 as @e[type=interaction,tag=sp_interact_tech] if data entity @s interaction at @s run function board_game:detect/tech

# ================================================
# 7) CONTROL BUTTON
# ================================================
execute as @e[type=interaction,tag=sp_control_btn] if data entity @s interaction at @s run function board_game:control_advance

# ================================================
# 8) BANKRUPT CHECK — last player standing wins
# ================================================
execute if score #game sp_phase matches 1.. store result score #alive sp_temp if entity @a[tag=sp_player,scores={sp_money=1..}]
execute if score #game sp_phase matches 1.. store result score #total_p sp_temp if entity @a[tag=sp_player]
execute if score #game sp_phase matches 1.. if score #total_p sp_temp matches 2.. if score #alive sp_temp matches ..1 run function board_game:end_game
