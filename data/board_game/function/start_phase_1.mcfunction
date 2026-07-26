# ============================================================
# Board Game — Phase 1: Betting
# ============================================================

scoreboard players set #game sp_phase 1
scoreboard players add #game sp_round 1

# --- Reset ---
scoreboard players set @a[tag=sp_player] sp_confirm 0
scoreboard players enable @a[tag=sp_player] sp_confirm
scoreboard players set @a[tag=sp_player] sp_cards_played 0

# --- Reset board indices ---
scoreboard players set #crypto sp_board_crypto 0
scoreboard players set #estate sp_board_estate 0
scoreboard players set #startup sp_board_startup 0
scoreboard players set #tech sp_board_tech 0

# --- Reset total bets from previous round ---
scoreboard players set #totals sp_total_crypto 0
scoreboard players set #totals sp_total_estate 0
scoreboard players set #totals sp_total_startup 0
scoreboard players set #totals sp_total_tech 0

# --- Clear UI ---
execute as @a[tag=sp_player] run clear @s minecraft:red_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]

# --- Open bet slots (clear old lock glass from money slots) ---
execute as @a[tag=sp_player] run item replace entity @s container.19 with air
execute as @a[tag=sp_player] run item replace entity @s container.21 with air
execute as @a[tag=sp_player] run item replace entity @s container.23 with air
execute as @a[tag=sp_player] run item replace entity @s container.25 with air

# --- Give 50M starting money (Round 1 only) ---
execute if score #game sp_round matches 1 as @a[tag=sp_player] run give @s minecraft:gold_nugget[minecraft:custom_name={text:"1 Million",italic:false,color:"gold"},minecraft:custom_data={sp_money:true},minecraft:max_stack_size=99] 50

# --- Draw Cards ---
# Count current cards
execute as @a[tag=sp_player] store result score @s sp_temp run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}] 0

# Round 1: Give 9 cards
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card
execute if score #game sp_round matches 1 as @a[tag=sp_player] run function board_game:give_random_card

# Round 2+: Draw 3 cards (max 12 cards total, so draw if ..11)
execute if score #game sp_round matches 2.. as @a[tag=sp_player] if score @s sp_temp matches ..11 run function board_game:give_random_card
execute if score #game sp_round matches 2.. as @a[tag=sp_player] store result score @s sp_temp run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}] 0
execute if score #game sp_round matches 2.. as @a[tag=sp_player] if score @s sp_temp matches ..11 run function board_game:give_random_card
execute if score #game sp_round matches 2.. as @a[tag=sp_player] store result score @s sp_temp run clear @s minecraft:paper[minecraft:custom_data~{sp_card:true}] 0
execute if score #game sp_round matches 2.. as @a[tag=sp_player] if score @s sp_temp matches ..11 run function board_game:give_random_card
# --- Announce Phase 1 ---
tellraw @a ["",{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true},{"text":"\n"},{"text":"  [Phase 1] Place Your Bets!","color":"gold","bold":true},{"text":"\n"},{"text":"  Put Money (Nuggets) in middle slots.","color":"white"},{"text":"\n"},{"text":"  Hold Carrot on a Stick and right click to confirm.","color":"gray","italic":true},{"text":"\n"},{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true}]
playsound minecraft:entity.experience_orb.pickup player @a[tag=sp_player] ~ ~ ~ 1.0 1.0

# --- Re-count actual money on hand (just in case) ---
execute as @a[tag=sp_player] store result score @s sp_money run clear @s minecraft:gold_nugget[minecraft:custom_data~{sp_money:true}] 0

# --- Snapshot money for 50% cap ---
execute as @a[tag=sp_player] run scoreboard players operation @s sp_money_snapshot = @s sp_money

# --- Broadcast ---
tellraw @a ["",{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true},{"text":"\n"},{"text":"  [Round "},{"score":{"name":"#game","objective":"sp_round"}},{"text":"/7] ","color":"gold","bold":true},{"text":"Place Your Bets!","color":"yellow"},{"text":"\n"},{"text":"  Drag money into the open slots.","color":"gray"},{"text":"\n"},{"text":"  Hold the ","color":"gray"},{"text":"✓ Ready!","color":"green","bold":true},{"text":" item and right-click.","color":"gray"},{"text":"\n"},{"text":"  ⚠ Max 50% of your money per slot!","color":"red","italic":true},{"text":"\n"},{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true}]

playsound minecraft:block.note_block.pling player @a[tag=sp_player] ~ ~ ~ 1.0 1.0
