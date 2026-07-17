# Read current item counts into temp scoreboards
execute store result score @s sp_temp_c if items entity @s container.19 minecraft:gold_nugget
execute store result score @s sp_temp_e if items entity @s container.21 minecraft:gold_nugget
execute store result score @s sp_temp_s if items entity @s container.23 minecraft:gold_nugget
execute store result score @s sp_temp_t if items entity @s container.25 minecraft:gold_nugget

# Compare with locked bets
execute unless score @s sp_temp_c = @s sp_bet_crypto run scoreboard players set @s sp_confirm 0
execute unless score @s sp_temp_e = @s sp_bet_estate run scoreboard players set @s sp_confirm 0
execute unless score @s sp_temp_s = @s sp_bet_startup run scoreboard players set @s sp_confirm 0
execute unless score @s sp_temp_t = @s sp_bet_tech run scoreboard players set @s sp_confirm 0

# If changed (sp_confirm reset to 0), announce and play warning sound
execute if score @s sp_confirm matches 0 run tellraw @a ["",{"text":"[BG] ","color":"dark_purple"},{"selector":"@s","color":"red"},{"text":" changed their bets!","color":"gray"}]
execute if score @s sp_confirm matches 0 run playsound minecraft:block.note_block.bass player @a ~ ~ ~ 1.0 0.5
