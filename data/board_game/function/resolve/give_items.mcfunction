$execute if score @s sp_temp matches 1.. run give @s minecraft:diamond[minecraft:custom_name={text:"99 Million",italic:false,color:"aqua"},minecraft:custom_data={sp_money:true,sp_diamond:true}] $(diamonds)
$execute if score @s sp_temp_c matches 1.. run give @s minecraft:gold_nugget[minecraft:custom_name={text:"1 Million",italic:false,color:"gold"},minecraft:custom_data={sp_money:true},minecraft:max_stack_size=99] $(nuggets)
execute as @e[type=item,distance=..2] run data modify entity @s Owner set from entity @p UUID

