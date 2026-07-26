# ============================================================
# Board Game — Check 50% Bet Cap
# Runs as each player when they confirm (sp_confirm=1) in Phase 1
# Rejects if any single slot exceeds 50% of sp_money_snapshot
# ============================================================

# Calculate cap = money_snapshot / 2
scoreboard players operation @s sp_calc = @s sp_money_snapshot
scoreboard players set #2 sp_temp 2
scoreboard players operation @s sp_calc /= #2 sp_temp

# Check each sector — if bet > cap, reject
execute if score @s sp_bet_crypto > @s sp_calc run scoreboard players set @s sp_confirm 0
execute if score @s sp_bet_crypto > @s sp_calc run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"⚠ Crypto bet exceeds 50% of your money! ","color":"red"},{"text":"Max: ","color":"gray"},{"score":{"name":"@s","objective":"sp_calc"},"color":"gold","bold":true},{"text":"M","color":"gray"}]
execute if score @s sp_bet_crypto > @s sp_calc run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

execute if score @s sp_bet_estate > @s sp_calc run scoreboard players set @s sp_confirm 0
execute if score @s sp_bet_estate > @s sp_calc run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"⚠ Estate bet exceeds 50% of your money! ","color":"red"},{"text":"Max: ","color":"gray"},{"score":{"name":"@s","objective":"sp_calc"},"color":"gold","bold":true},{"text":"M","color":"gray"}]
execute if score @s sp_bet_estate > @s sp_calc run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

execute if score @s sp_bet_startup > @s sp_calc run scoreboard players set @s sp_confirm 0
execute if score @s sp_bet_startup > @s sp_calc run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"⚠ Startup bet exceeds 50% of your money! ","color":"red"},{"text":"Max: ","color":"gray"},{"score":{"name":"@s","objective":"sp_calc"},"color":"gold","bold":true},{"text":"M","color":"gray"}]
execute if score @s sp_bet_startup > @s sp_calc run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5

execute if score @s sp_bet_tech > @s sp_calc run scoreboard players set @s sp_confirm 0
execute if score @s sp_bet_tech > @s sp_calc run tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"⚠ Tech bet exceeds 50% of your money! ","color":"red"},{"text":"Max: ","color":"gray"},{"score":{"name":"@s","objective":"sp_calc"},"color":"gold","bold":true},{"text":"M","color":"gray"}]
execute if score @s sp_bet_tech > @s sp_calc run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.5
