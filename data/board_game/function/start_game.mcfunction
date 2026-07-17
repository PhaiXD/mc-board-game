# ============================================================
# Board Game — Start Game (after countdown)
# Tags nearby players and kicks off Round 1
# ============================================================

# Tag all nearby players as game participants
tag @a[tag=sp_near_board] add sp_player

# Reset countdown state
scoreboard players set #game sp_countdown -1
scoreboard players set #game sp_expected 0

# Hide border lines
execute as @e[type=block_display,tag=sp_border_line] run data modify entity @s transformation.scale[1] set value 0.0f

# Announce
tellraw @a ["",{"text":"[BG] ","color":"dark_purple","bold":true},{"text":"Game started! Good luck, investors!","color":"gold"}]
playsound minecraft:entity.player.levelup player @a[tag=sp_player] ~ ~ ~ 1.0 1.2

# Start Round 1
function board_game:start_phase_1
