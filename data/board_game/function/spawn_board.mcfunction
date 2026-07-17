# ============================================================
# Board Game — Board Generation
# Run at the desired board origin: /function board_game:spawn_board
# Layout (top-down, +X right, +Z forward):
#   [Crypto]  [Estate]
#   [Startup] [Tech]       [Control Button]
# ============================================================

# -------------------------------------------------------
# CRYPTO ZONE — Purple Concrete
# -------------------------------------------------------
summon block_display ~ ~ ~ {block_state:{Name:"minecraft:purple_concrete"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,0.1f,2f]},Tags:["sp_entity","sp_zone_crypto"]}
summon text_display ~1 ~1.4 ~1 {text:[{text:"⚡ CRYPTO",color:"light_purple",bold:true},{text:"\nIndex: ",color:"gray"},{score:{name:"#crypto",objective:"sp_board_crypto"},color:"white",bold:true}],line_width:200,background:1073741824,shadow:true,see_through:false,billboard:"vertical",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},Tags:["sp_entity","sp_text_crypto"]}
summon interaction ~1 ~0.1 ~1 {width:2f,height:2f,Tags:["sp_entity","sp_interact_crypto"]}

# -------------------------------------------------------
# ESTATE ZONE — Light Blue Concrete
# -------------------------------------------------------
summon block_display ~4 ~ ~ {block_state:{Name:"minecraft:light_blue_concrete"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,0.1f,2f]},Tags:["sp_entity","sp_zone_estate"]}
summon text_display ~5 ~1.4 ~1 {text:[{text:"🏠 ESTATE",color:"aqua",bold:true},{text:"\nIndex: ",color:"gray"},{score:{name:"#estate",objective:"sp_board_estate"},color:"white",bold:true}],line_width:200,background:1073741824,shadow:true,see_through:false,billboard:"vertical",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},Tags:["sp_entity","sp_text_estate"]}
summon interaction ~5 ~0.1 ~1 {width:2f,height:2f,Tags:["sp_entity","sp_interact_estate"]}

# -------------------------------------------------------
# STARTUP ZONE — Yellow Concrete
# -------------------------------------------------------
summon block_display ~ ~ ~4 {block_state:{Name:"minecraft:yellow_concrete"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,0.1f,2f]},Tags:["sp_entity","sp_zone_startup"]}
summon text_display ~1 ~1.4 ~5 {text:[{text:"🚀 STARTUP",color:"yellow",bold:true},{text:"\nIndex: ",color:"gray"},{score:{name:"#startup",objective:"sp_board_startup"},color:"white",bold:true}],line_width:200,background:1073741824,shadow:true,see_through:false,billboard:"vertical",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},Tags:["sp_entity","sp_text_startup"]}
summon interaction ~1 ~0.1 ~5 {width:2f,height:2f,Tags:["sp_entity","sp_interact_startup"]}

# -------------------------------------------------------
# TECH ZONE — Lime Concrete
# -------------------------------------------------------
summon block_display ~4 ~ ~4 {block_state:{Name:"minecraft:lime_concrete"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,0.1f,2f]},Tags:["sp_entity","sp_zone_tech"]}
summon text_display ~5 ~1.4 ~5 {text:[{text:"💻 TECH",color:"green",bold:true},{text:"\nIndex: ",color:"gray"},{score:{name:"#tech",objective:"sp_board_tech"},color:"white",bold:true}],line_width:200,background:1073741824,shadow:true,see_through:false,billboard:"vertical",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.2f,1.2f,1.2f]},Tags:["sp_entity","sp_text_tech"]}
summon interaction ~5 ~0.1 ~5 {width:2f,height:2f,Tags:["sp_entity","sp_interact_tech"]}

# -------------------------------------------------------
# CONTROL BUTTON — Gold block in the center
# -------------------------------------------------------
summon block_display ~2.5 ~ ~2.5 {block_state:{Name:"minecraft:gold_block"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,0.2f,1f]},Tags:["sp_entity","sp_control_visual"]}
summon text_display ~3 ~0.8 ~3 {text:[{text:"⏩ Force Next Phase",color:"gold",bold:true}],shadow:true,billboard:"vertical",background:1073741824,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f]},Tags:["sp_entity","sp_control_text"]}
summon interaction ~3 ~0 ~3 {width:1f,height:1f,Tags:["sp_entity","sp_control_btn"]}

# --- Border Lines (Phase 0) ---
summon block_display ~-7 ~0.01 ~-7 {block_state:{Name:"minecraft:lime_carpet"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[20.1f,1f,0.1f]},Tags:["sp_entity","sp_border_line"]}
summon block_display ~-7 ~0.01 ~13 {block_state:{Name:"minecraft:lime_carpet"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[20.1f,1f,0.1f]},Tags:["sp_entity","sp_border_line"]}
summon block_display ~-7 ~0.01 ~-7 {block_state:{Name:"minecraft:lime_carpet"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.1f,1f,20.1f]},Tags:["sp_entity","sp_border_line"]}
summon block_display ~13 ~0.01 ~-7 {block_state:{Name:"minecraft:lime_carpet"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.1f,1f,20.1f]},Tags:["sp_entity","sp_border_line"]}

# --- Confirmation ---
tellraw @a [{"text":"[Board Game] ","color":"dark_purple","bold":true},{"text":"Board spawned! 4 zones + control button placed.","color":"gold"}]
