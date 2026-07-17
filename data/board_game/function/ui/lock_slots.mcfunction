# ============================================================
# Board Game — UI Lock Slots (New Layout)
# ============================================================
# Grid:
#   Col0   Col1(Crypto)  Col2   Col3(Estate)  Col4   Col5(Startup)  Col6   Col7(Tech)  Col8
# R1: [gray9] [purp10]   [gray11][blue12]     [gray13][yel14]       [gray15][grn16]    [gray17]
# R2: [gray18][MONEY19]  [gray20][MONEY21]    [gray22][MONEY23]     [gray24][MONEY25]  [gray26]
# R3: [gray27][purp28]   [gray29][blue30]     [gray31][yel32]       [gray33][grn34]    [gray35]
# Money slots: 19, 21, 23, 25 (open during Phase 1 only)
# ============================================================

# --- Row 1: Gray separators + colored labels ---
item replace entity @s container.9 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.10 with minecraft:purple_stained_glass_pane[minecraft:custom_name={text:"⚡ Crypto",italic:false,color:"light_purple"},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.11 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.12 with minecraft:light_blue_stained_glass_pane[minecraft:custom_name={text:"🏠 Estate",italic:false,color:"aqua"},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.13 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.14 with minecraft:yellow_stained_glass_pane[minecraft:custom_name={text:"🚀 Startup",italic:false,color:"yellow"},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.15 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.16 with minecraft:lime_stained_glass_pane[minecraft:custom_name={text:"💻 Tech",italic:false,color:"green"},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.17 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]

# --- Row 2: Gray separators (money slots 19,21,23,25 NOT touched here) ---
item replace entity @s container.18 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.20 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.22 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.24 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.26 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]

# --- Row 3: Gray separators + colored labels ---
item replace entity @s container.27 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.28 with minecraft:purple_stained_glass_pane[minecraft:custom_name={text:"⚡ Crypto",italic:false,color:"light_purple"},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.29 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.30 with minecraft:light_blue_stained_glass_pane[minecraft:custom_name={text:"🏠 Estate",italic:false,color:"aqua"},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.31 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.32 with minecraft:yellow_stained_glass_pane[minecraft:custom_name={text:"🚀 Startup",italic:false,color:"yellow"},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.33 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.34 with minecraft:lime_stained_glass_pane[minecraft:custom_name={text:"💻 Tech",italic:false,color:"green"},minecraft:custom_data={sp_ui:true}]
item replace entity @s container.35 with minecraft:gray_stained_glass_pane[minecraft:custom_name={text:" ",italic:false},minecraft:custom_data={sp_ui:true}]

# --- Confirm button at hotbar slot 8 ---
execute unless items entity @s container.8 minecraft:carrot_on_a_stick[minecraft:custom_data~{sp_confirm_btn:true}] run item replace entity @s container.8 with minecraft:carrot_on_a_stick[minecraft:custom_name={text:"✓ Ready!",italic:false,color:"green",bold:true},minecraft:lore=[{text:"Hold and right-click to confirm",italic:false,color:"gray"}],minecraft:custom_data={sp_confirm_btn:true,sp_ui:true}]

# --- Phase 2: Lock money slots with red glass and display bet amount ---
execute if score #game sp_phase matches 2 run execute store result storage board_game:ui bet_crypto int 1 run scoreboard players get @s sp_bet_crypto
execute if score #game sp_phase matches 2 run execute store result storage board_game:ui bet_estate int 1 run scoreboard players get @s sp_bet_estate
execute if score #game sp_phase matches 2 run execute store result storage board_game:ui bet_startup int 1 run scoreboard players get @s sp_bet_startup
execute if score #game sp_phase matches 2 run execute store result storage board_game:ui bet_tech int 1 run scoreboard players get @s sp_bet_tech
execute if score #game sp_phase matches 2 run function board_game:ui/lock_red_glass with storage board_game:ui
