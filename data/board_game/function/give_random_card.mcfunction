# ============================================================
# Board Game — Give Random Card
# Gives the executing player 1 random market card (-3 to +3)
# ============================================================

# Roll a random number between -3 and 3
execute store result score #random sp_temp run random value -3..3

# Give appropriate card
execute if score #random sp_temp matches 3 run give @s minecraft:paper[minecraft:custom_name={text:"▲ +3",italic:false,color:"dark_green",bold:true},minecraft:lore=[{text:"Raise index by 3",italic:false,color:"gray"}],minecraft:custom_data={sp_card:true,sp_value:3}] 1
execute if score #random sp_temp matches 2 run give @s minecraft:paper[minecraft:custom_name={text:"▲ +2",italic:false,color:"green",bold:true},minecraft:lore=[{text:"Raise index by 2",italic:false,color:"gray"}],minecraft:custom_data={sp_card:true,sp_value:2}] 1
execute if score #random sp_temp matches 1 run give @s minecraft:paper[minecraft:custom_name={text:"▲ +1",italic:false,color:"green",bold:true},minecraft:lore=[{text:"Raise index by 1",italic:false,color:"gray"}],minecraft:custom_data={sp_card:true,sp_value:1}] 1

execute if score #random sp_temp matches 0 run give @s minecraft:paper[minecraft:custom_name={text:"● 0",italic:false,color:"yellow",bold:true},minecraft:lore=[{text:"No effect — bluff!",italic:false,color:"gray"}],minecraft:custom_data={sp_card:true,sp_value:0}] 1

execute if score #random sp_temp matches -1 run give @s minecraft:paper[minecraft:custom_name={text:"▼ -1",italic:false,color:"red",bold:true},minecraft:lore=[{text:"Lower index by 1",italic:false,color:"gray"}],minecraft:custom_data={sp_card:true,sp_value:-1}] 1
execute if score #random sp_temp matches -2 run give @s minecraft:paper[minecraft:custom_name={text:"▼ -2",italic:false,color:"red",bold:true},minecraft:lore=[{text:"Lower index by 2",italic:false,color:"gray"}],minecraft:custom_data={sp_card:true,sp_value:-2}] 1
execute if score #random sp_temp matches -3 run give @s minecraft:paper[minecraft:custom_name={text:"▼ -3",italic:false,color:"dark_red",bold:true},minecraft:lore=[{text:"Lower index by 3",italic:false,color:"gray"}],minecraft:custom_data={sp_card:true,sp_value:-3}] 1
