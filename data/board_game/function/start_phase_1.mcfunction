# ============================================================
# Board Game — Start Round (Deal + Play Phase)
# ============================================================

scoreboard players set #game sp_phase 1
scoreboard players add #game sp_round 1

# --- Reset per-round scores ---
scoreboard players set @a[tag=sp_player] sp_cards_played 0
scoreboard players set @a[tag=sp_player] sp_played_crypto 0
scoreboard players set @a[tag=sp_player] sp_played_estate 0
scoreboard players set @a[tag=sp_player] sp_played_startup 0
scoreboard players set @a[tag=sp_player] sp_played_tech 0
scoreboard players set @a[tag=sp_player] sp_use_click 0
tag @a[tag=sp_player] remove sp_ready

# --- Reset board indices ---
scoreboard players set #crypto sp_board_crypto 0
scoreboard players set #estate sp_board_estate 0
scoreboard players set #startup sp_board_startup 0
scoreboard players set #tech sp_board_tech 0

# --- Kill leftover card displays ---
kill @e[type=item_display,tag=sp_played_card]

# --- Deal Cards ---
# Round 1: Give 5 cards to each player
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card

# Round 2+: Draw up to minimum 3 cards (if player has fewer than 3)
execute if score #game sp_round matches 2.. as @a[tag=sp_player] store result score @s sp_temp run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}] 0
execute if score #game sp_round matches 2.. as @a[tag=sp_player] if score @s sp_temp matches ..2 run function board_game:give_random_card
execute if score #game sp_round matches 2.. as @a[tag=sp_player] store result score @s sp_temp run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}] 0
execute if score #game sp_round matches 2.. as @a[tag=sp_player] if score @s sp_temp matches ..2 run function board_game:give_random_card
execute if score #game sp_round matches 2.. as @a[tag=sp_player] store result score @s sp_temp run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}] 0
execute if score #game sp_round matches 2.. as @a[tag=sp_player] if score @s sp_temp matches ..2 run function board_game:give_random_card

# --- Give Ready button (only round 1, since it persists) ---
execute if score #game sp_round matches 1 as @a[tag=sp_player] run give @s minecraft:carrot_on_a_stick[minecraft:custom_name={text:"✅ Ready",italic:false,color:"green",bold:true},minecraft:lore=[{text:"Right-click when you are done playing cards",italic:false,color:"gray"}],minecraft:custom_data={sp_confirm_btn:true}] 1

# --- Count Players ---
execute as @a[tag=sp_player] store result score #game sp_player_count if entity @a[tag=sp_player]

# --- Update card count sidebar ---
execute as @a[tag=sp_player] store result score @s sp_cards run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}] 0

# --- Announce ---
tellraw @a ["",{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true},{"text":"\n"},{"text":"  [Round "},{"score":{"name":"#game","objective":"sp_round"}},{"text":"/7] ","color":"gold","bold":true},{"text":"Play Phase!","color":"yellow"},{"text":"\n"},{"text":"  🎯 Hold a card + right-click a zone to play","color":"white"},{"text":"\n"},{"text":"  ✅ Use the Ready item when you are done","color":"gray"},{"text":"\n"},{"text":"  When everyone is ready, cards are revealed!","color":"gray","italic":true},{"text":"\n"},{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true}]

playsound minecraft:entity.experience_orb.pickup player @a[tag=sp_player] ~ ~ ~ 1.0 1.0
playsound minecraft:block.note_block.pling player @a[tag=sp_player] ~ ~ ~ 1.0 1.0
