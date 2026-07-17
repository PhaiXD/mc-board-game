# ============================================================
# Board Game — Lock Red Glass (Macro)
# Inserts the player's bet amount into the lore of the red glass
# ============================================================

$item replace entity @s container.19 with minecraft:red_stained_glass_pane[minecraft:custom_name={text:"🔒 Crypto",italic:false,color:"red"},minecraft:custom_data={sp_ui:true},minecraft:lore=[{text:"Bet: $(bet_crypto) M",color:"gold",italic:false}]]
$item replace entity @s container.21 with minecraft:red_stained_glass_pane[minecraft:custom_name={text:"🔒 Estate",italic:false,color:"red"},minecraft:custom_data={sp_ui:true},minecraft:lore=[{text:"Bet: $(bet_estate) M",color:"gold",italic:false}]]
$item replace entity @s container.23 with minecraft:red_stained_glass_pane[minecraft:custom_name={text:"🔒 Startup",italic:false,color:"red"},minecraft:custom_data={sp_ui:true},minecraft:lore=[{text:"Bet: $(bet_startup) M",color:"gold",italic:false}]]
$item replace entity @s container.25 with minecraft:red_stained_glass_pane[minecraft:custom_name={text:"🔒 Tech",italic:false,color:"red"},minecraft:custom_data={sp_ui:true},minecraft:lore=[{text:"Bet: $(bet_tech) M",color:"gold",italic:false}]]
