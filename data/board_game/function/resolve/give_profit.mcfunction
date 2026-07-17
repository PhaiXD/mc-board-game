# ============================================================
# Board Game — Give Profit (Macro)
# ============================================================

$give @s minecraft:gold_nugget[minecraft:custom_name={text:"1 Million",italic:false,color:"gold"},minecraft:custom_data={sp_money:true}] $(payout)
$tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"Payout: ","color":"gray"},{"text":"+$(payout)M ","color":"green","bold":true},{"text":"from ","color":"gray"},{"text":$(project),"color":$(color)},{"text":"!","color":"gray"}]
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
