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
tellraw @a ["",{"text":"[BG] ","color":"dark_purple","bold":true},{"text":"Game started! Good luck, traders!","color":"gold"}]
playsound minecraft:entity.player.levelup player @a[tag=sp_player] ~ ~ ~ 1.0 1.2

# Reset game state for fresh start
scoreboard players set #game sp_round 0
scoreboard players set #game sp_phase 0
scoreboard players set #game sp_consecutive_passes 0
scoreboard players set #game sp_current_turn 0

# Clear any stale items from previous games
execute as @a[tag=sp_player] run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}]
execute as @a[tag=sp_player] run clear @s minecraft:carrot_on_a_stick[minecraft:custom_data~{sp_confirm_btn:true}]
kill @e[type=item_display,tag=sp_played_card]

# Reset player scores
scoreboard players set @a[tag=sp_player] sp_cards 0
scoreboard players set @a[tag=sp_player] sp_cards_played 0
scoreboard players set @a[tag=sp_player] sp_played_crypto 0
scoreboard players set @a[tag=sp_player] sp_played_estate 0
scoreboard players set @a[tag=sp_player] sp_played_startup 0
scoreboard players set @a[tag=sp_player] sp_played_tech 0

# Start Round 1
function board_game:start_phase_1
