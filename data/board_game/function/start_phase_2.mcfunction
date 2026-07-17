# ============================================================
# Board Game — Phase 2: Market Manipulation
# ============================================================

scoreboard players set #game sp_phase 2
scoreboard players set @a[tag=sp_player] sp_confirm 0
scoreboard players enable @a[tag=sp_player] sp_confirm
scoreboard players set @a[tag=sp_player] sp_cards_played 0

# --- Lock bets: read money from slots then clear ---
execute as @a[tag=sp_player] run function board_game:lock_bets

# --- Lock visual: red glass in money slots (handled by lock_slots now) ---

tellraw @a ["",{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true},{"text":"\n"},{"text":"  [Phase 2] Market Manipulation!","color":"gold","bold":true},{"text":"\n"},{"text":"  Hold a card → right-click a zone.","color":"white"},{"text":"\n"},{"text":"  Others see WHERE, not WHAT.","color":"gray","italic":true},{"text":"\n"},{"text":"  Play as many cards as you want. Then confirm.","color":"gray"},{"text":"\n"},{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true}]

playsound minecraft:entity.experience_orb.pickup player @a[tag=sp_player] ~ ~ ~ 1.0 1.0
