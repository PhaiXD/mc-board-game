# ============================================================
# Board Game — Exchange System (Offhand slot)
# ============================================================

# --- Swap to Diamond ---
execute store result score @s sp_temp if items entity @s weapon.offhand minecraft:gold_nugget
execute if score @s sp_temp matches 99.. run clear @s minecraft:gold_nugget[minecraft:custom_data~{sp_money:true}] 99
execute if score @s sp_temp matches 99.. run give @s minecraft:diamond[minecraft:custom_name={text:"99 Million",italic:false,color:"aqua"},minecraft:custom_data={sp_money:true,sp_diamond:true}] 1
execute if score @s sp_temp matches 99.. run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.5

# --- Swap to Nuggets ---
execute store result score @s sp_temp if items entity @s weapon.offhand minecraft:diamond
execute if score @s sp_temp matches 1.. run clear @s minecraft:diamond[minecraft:custom_data~{sp_money:true}] 1
execute if score @s sp_temp matches 1.. run give @s minecraft:gold_nugget[minecraft:custom_name={text:"1 Million",italic:false,color:"gold"},minecraft:custom_data={sp_money:true},minecraft:max_stack_size=99] 99
execute if score @s sp_temp matches 1.. run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.5
