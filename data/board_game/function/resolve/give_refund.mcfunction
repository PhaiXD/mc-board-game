# ============================================================
# Board Game — Give Refund (Macro)
# ============================================================

$give @s minecraft:gold_nugget[minecraft:custom_name={text:"1 Million",italic:false,color:"gold"},minecraft:custom_data={sp_money:true}] $(payout)
$tellraw @s ["",{"text":"[BG] ","color":"dark_purple"},{"text":"Refund: ","color":"gray"},{"text":"+$(payout)M ","color":"yellow","bold":true},{"text":"from ","color":"gray"},{"text":$(project),"color":$(color)},{"text":".","color":"gray"}]
