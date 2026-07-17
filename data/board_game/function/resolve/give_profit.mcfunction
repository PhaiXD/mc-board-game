# ============================================================
# Board Game — Give Profit
# ============================================================

scoreboard players operation @s sp_temp = @s sp_payout
scoreboard players set #99 sp_temp 99
scoreboard players operation @s sp_temp_c = @s sp_temp
scoreboard players operation @s sp_temp /= #99 sp_temp
scoreboard players operation @s sp_temp_c %= #99 sp_temp

execute store result storage board_game:macro diamonds int 1 run scoreboard players get @s sp_temp
execute store result storage board_game:macro nuggets int 1 run scoreboard players get @s sp_temp_c

execute if score @s sp_temp matches 1.. run function board_game:resolve/give_diamonds with storage board_game:macro
execute if score @s sp_temp_c matches 1.. run function board_game:resolve/give_nuggets with storage board_game:macro
execute as @e[type=item,distance=..2] run data modify entity @s Owner set from entity @p UUID

function board_game:resolve/tellraw_profit with storage board_game:macro
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
