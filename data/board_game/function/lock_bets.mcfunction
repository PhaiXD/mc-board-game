# ============================================================
# Board Game — Lock Bets Helper
# Reads money from slots 19/21/23/25 into scoreboards, then clears
# ============================================================

scoreboard players set @s sp_bet_crypto 0
scoreboard players set @s sp_bet_estate 0
scoreboard players set @s sp_bet_startup 0
scoreboard players set @s sp_bet_tech 0

# Read slot item counts (ignoring custom_data to be completely foolproof)
execute store result score @s sp_bet_crypto if items entity @s container.19 minecraft:gold_nugget
execute store result score @s sp_bet_estate if items entity @s container.21 minecraft:gold_nugget
execute store result score @s sp_bet_startup if items entity @s container.23 minecraft:gold_nugget
execute store result score @s sp_bet_tech if items entity @s container.25 minecraft:gold_nugget

# DEBUG: Tell player their bet
tellraw @s ["",{"text":"[DEBUG] Your Crypto Bet locked at: "},{"score":{"name":"@s","objective":"sp_bet_crypto"}}]

# Clear money from those slots
item replace entity @s container.19 with air
item replace entity @s container.21 with air
item replace entity @s container.23 with air
item replace entity @s container.25 with air
