# ============================================================
# Board Game — Phase 3: Resolution & Payout
# ============================================================

scoreboard players set #game sp_phase 3
scoreboard players set @a[tag=sp_player] sp_confirm 0
scoreboard players enable @a[tag=sp_player] sp_confirm

# Open up the bet slots (clear red glass)
execute as @a[tag=sp_player] run item replace entity @s container.19 with air
execute as @a[tag=sp_player] run item replace entity @s container.21 with air
execute as @a[tag=sp_player] run item replace entity @s container.23 with air
execute as @a[tag=sp_player] run item replace entity @s container.25 with air

# Announce market state
tellraw @a ["",{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true},{"text":"\n"},{"text":"  [Phase 3] ","color":"gold","bold":true},{"text":"Resolution!","color":"yellow"},{"text":"\n"},{"text":"═══════════════════════════════","color":"dark_purple","strikethrough":true}]
tellraw @a ["",{"text":"  ⚡ Crypto: ","color":"light_purple"},{"score":{"name":"#crypto","objective":"sp_board_crypto"},"color":"white","bold":true},{"text":"  |  ","color":"dark_gray"},{"text":"🏠 Estate: ","color":"aqua"},{"score":{"name":"#estate","objective":"sp_board_estate"},"color":"white","bold":true}]
tellraw @a ["",{"text":"  🚀 Startup: ","color":"yellow"},{"score":{"name":"#startup","objective":"sp_board_startup"},"color":"white","bold":true},{"text":"  |  ","color":"dark_gray"},{"text":"💻 Tech: ","color":"green"},{"score":{"name":"#tech","objective":"sp_board_tech"},"color":"white","bold":true}]
tellraw @a {"text":""}

# Run payout
execute as @a[tag=sp_player] run function board_game:resolve

# Clean display entities
kill @e[type=item_display,tag=sp_chip]
kill @e[type=item_display,tag=sp_played_card]

tellraw @a {"text":""}
tellraw @a ["",{"text":"[BG] ","color":"dark_purple","bold":true},{"text":"Payouts complete! Confirm to continue.","color":"gold"}]

playsound minecraft:entity.player.levelup player @a[tag=sp_player] ~ ~ ~ 0.8 1.0
