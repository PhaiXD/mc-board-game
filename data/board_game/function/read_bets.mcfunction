# Setup const
scoreboard players set #99 sp_temp 99

# --- Crypto ---
execute store result score @s sp_bet_crypto if items entity @s container.19 minecraft:gold_nugget
execute store result score @s sp_temp if items entity @s container.19 minecraft:diamond
scoreboard players operation @s sp_temp *= #99 sp_temp
scoreboard players operation @s sp_bet_crypto += @s sp_temp

# --- Estate ---
execute store result score @s sp_bet_estate if items entity @s container.21 minecraft:gold_nugget
execute store result score @s sp_temp if items entity @s container.21 minecraft:diamond
scoreboard players operation @s sp_temp *= #99 sp_temp
scoreboard players operation @s sp_bet_estate += @s sp_temp

# --- Startup ---
execute store result score @s sp_bet_startup if items entity @s container.23 minecraft:gold_nugget
execute store result score @s sp_temp if items entity @s container.23 minecraft:diamond
scoreboard players operation @s sp_temp *= #99 sp_temp
scoreboard players operation @s sp_bet_startup += @s sp_temp

# --- Tech ---
execute store result score @s sp_bet_tech if items entity @s container.25 minecraft:gold_nugget
execute store result score @s sp_temp if items entity @s container.25 minecraft:diamond
scoreboard players operation @s sp_temp *= #99 sp_temp
scoreboard players operation @s sp_bet_tech += @s sp_temp
