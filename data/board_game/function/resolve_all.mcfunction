# ============================================================
# Board Game — Resolve All (Replaces Phase 3)
# ============================================================

# Announce market state
tellraw @a ["",{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true},{"text":"\n"},{"text":"  [End of Round] ","color":"gold","bold":true},{"text":"Resolution!","color":"yellow"},{"text":"\n"},{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true}]
tellraw @a ["",{"text":"  ⚡ Crypto: ","color":"light_purple"},{"score":{"name":"#crypto","objective":"sp_board_crypto"},"color":"white","bold":true},{"text":"  |  ","color":"dark_gray"},{"text":"🏠 Estate: ","color":"aqua"},{"score":{"name":"#estate","objective":"sp_board_estate"},"color":"white","bold":true}]
tellraw @a ["",{"text":"  🚀 Startup: ","color":"yellow"},{"score":{"name":"#startup","objective":"sp_board_startup"},"color":"white","bold":true},{"text":"  |  ","color":"dark_gray"},{"text":"💻 Tech: ","color":"green"},{"score":{"name":"#tech","objective":"sp_board_tech"},"color":"white","bold":true}]
tellraw @a {"text":""}

# Open up the bet slots (clear red glass)
execute as @a[tag=sp_player] run item replace entity @s container.19 with air
execute as @a[tag=sp_player] run item replace entity @s container.21 with air
execute as @a[tag=sp_player] run item replace entity @s container.23 with air
execute as @a[tag=sp_player] run item replace entity @s container.25 with air

# Run payout for each player
execute as @a[tag=sp_player] run function board_game:resolve

# Clean display entities
kill @e[type=item_display,tag=sp_chip]
