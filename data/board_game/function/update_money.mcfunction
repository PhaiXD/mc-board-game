# ============================================================
# Board Game — Update Sidebar Money Score
# ============================================================

scoreboard players set #99 sp_temp 99

# Clear nuggets with count 0 to get the amount
execute store result score @s sp_money run clear @s minecraft:gold_nugget[minecraft:custom_data~{sp_money:true}] 0

# Count diamonds
execute store result score @s sp_temp run clear @s minecraft:diamond[minecraft:custom_data~{sp_money:true}] 0

# sp_temp *= 99
scoreboard players operation @s sp_temp *= #99 sp_temp

# sp_money += diamonds * 99
scoreboard players operation @s sp_money += @s sp_temp

# In Phase 2, the bet items are removed from inventory and locked.
# To prevent false bankruptcies and accurately reflect total wealth, we add the locked bets back to the display score.
execute if score #game sp_phase matches 2 run scoreboard players operation @s sp_money += @s sp_bet_crypto
execute if score #game sp_phase matches 2 run scoreboard players operation @s sp_money += @s sp_bet_estate
execute if score #game sp_phase matches 2 run scoreboard players operation @s sp_money += @s sp_bet_startup
execute if score #game sp_phase matches 2 run scoreboard players operation @s sp_money += @s sp_bet_tech
