# ============================================================
# Board Game - Startup Interaction Handler
# ============================================================
execute as @a[tag=sp_player,distance=..8,sort=nearest,limit=1] if items entity @s weapon.mainhand minecraft:paper[minecraft:custom_data~{sp_card:true}] run function board_game:detect/process_startup
data remove entity @s interaction
