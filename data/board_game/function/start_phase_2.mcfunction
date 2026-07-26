# ============================================================
# Board Game — Phase 2: Market Manipulation
# ============================================================

scoreboard players set #game sp_phase 2
scoreboard players set @a[tag=sp_player] sp_confirm 0
scoreboard players enable @a[tag=sp_player] sp_confirm
scoreboard players set @a[tag=sp_player] sp_cards_played 0

# --- Sum all bets (public reveal, no per-player info) ---
scoreboard players set #totals sp_total_crypto 0
scoreboard players set #totals sp_total_estate 0
scoreboard players set #totals sp_total_startup 0
scoreboard players set #totals sp_total_tech 0
execute as @a[tag=sp_player] run scoreboard players operation #totals sp_total_crypto += @s sp_bet_crypto
execute as @a[tag=sp_player] run scoreboard players operation #totals sp_total_estate += @s sp_bet_estate
execute as @a[tag=sp_player] run scoreboard players operation #totals sp_total_startup += @s sp_bet_startup
execute as @a[tag=sp_player] run scoreboard players operation #totals sp_total_tech += @s sp_bet_tech

tellraw @a ["",{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true},{"text":"\n"},{"text":"  📊 Total Investments This Round","color":"gold","bold":true},{"text":"\n"},{"text":"  ⚡ Crypto: ","color":"light_purple"},{"score":{"name":"#totals","objective":"sp_total_crypto"},"color":"white","bold":true},{"text":"M","color":"gray"},{"text":"  |  ","color":"dark_gray"},{"text":"🏠 Estate: ","color":"aqua"},{"score":{"name":"#totals","objective":"sp_total_estate"},"color":"white","bold":true},{"text":"M","color":"gray"},{"text":"\n"},{"text":"  🚀 Startup: ","color":"yellow"},{"score":{"name":"#totals","objective":"sp_total_startup"},"color":"white","bold":true},{"text":"M","color":"gray"},{"text":"  |  ","color":"dark_gray"},{"text":"💻 Tech: ","color":"green"},{"score":{"name":"#totals","objective":"sp_total_tech"},"color":"white","bold":true},{"text":"M","color":"gray"},{"text":"\n"},{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true}]
playsound minecraft:block.note_block.bell player @a[tag=sp_player] ~ ~ ~ 1.0 1.0

# --- Lock bets: read money from slots then clear ---
execute as @a[tag=sp_player] run function board_game:lock_bets

# --- Lock visual: red glass in money slots (handled by lock_slots now) ---

tellraw @a ["",{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true},{"text":"\n"},{"text":"  [Phase 2] Market Manipulation!","color":"gold","bold":true},{"text":"\n"},{"text":"  Hold a card → right-click a zone.","color":"white"},{"text":"\n"},{"text":"  Others see WHERE, not WHAT.","color":"gray","italic":true},{"text":"\n"},{"text":"  Play as many cards as you want. Then confirm.","color":"gray"},{"text":"\n"},{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true}]

playsound minecraft:entity.experience_orb.pickup player @a[tag=sp_player] ~ ~ ~ 1.0 1.0
