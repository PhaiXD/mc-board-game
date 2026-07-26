# ============================================================
# Board Game — Control Button
# ============================================================

data remove entity @s interaction
execute store result score #advance_from sp_temp run scoreboard players get #game sp_phase

# --- LOBBY: Start countdown ---
execute if score #advance_from sp_temp matches 0 store result score #game sp_expected if entity @a[tag=sp_near_board]
execute if score #advance_from sp_temp matches 0 if score #game sp_expected matches 0 run tellraw @p ["",{"text":"[BG] ","color":"dark_purple"},{"text":"No players nearby!","color":"red"}]
execute if score #advance_from sp_temp matches 0 if score #game sp_expected matches 1.. run scoreboard players set #game sp_countdown 100
execute if score #advance_from sp_temp matches 0 if score #game sp_expected matches 1.. run tellraw @a[tag=sp_near_board] ["",{"text":"[BG] ","color":"dark_purple"},{"text":"Game starting! Stay near the board!","color":"gold"}]
execute if score #advance_from sp_temp matches 0 if score #game sp_expected matches 1.. run playsound minecraft:block.note_block.bell player @a[tag=sp_near_board] ~ ~ ~ 1.0 1.0

# --- IN-GAME: Force resolve (admin) ---
execute if score #advance_from sp_temp matches 1 run function board_game:resolve
execute if score #advance_from sp_temp matches 1 run scoreboard players operation #check_round sp_temp = #game sp_round
execute if score #advance_from sp_temp matches 1 if score #check_round sp_temp matches ..6 run function board_game:start_phase_1
execute if score #advance_from sp_temp matches 1 if score #check_round sp_temp matches 7.. run function board_game:end_game

execute if score #advance_from sp_temp matches 1.. run tellraw @a ["",{"text":"[BG] ","color":"dark_purple","bold":true},{"text":"⏩ Phase advanced!","color":"yellow"}]
execute if score #advance_from sp_temp matches 1.. run playsound minecraft:block.note_block.bell player @a ~ ~ ~ 1.0 1.0
