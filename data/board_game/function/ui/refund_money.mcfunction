# ============================================================
# Board Game — Refund Money (Macro)
# Gives back money that was accidentally placed on glass slots
# ============================================================

$give @s minecraft:gold_nugget[minecraft:custom_name={text:"1 Million",italic:false,color:"gold"},minecraft:custom_data={sp_money:true}] $(count)
