# ============================================================
# Board Game — Board Cleanup (Full Reset)
# ============================================================

# Kill all board entities
kill @e[type=interaction,tag=sp_entity]
kill @e[type=block_display,tag=sp_entity]
kill @e[type=text_display,tag=sp_entity]
kill @e[type=item_display,tag=sp_entity]
kill @e[type=item_display,tag=sp_chip]
kill @e[type=item_display,tag=sp_played_card]

# Reset game state
scoreboard players set #game sp_phase 0
scoreboard players set #game sp_round 0
scoreboard players set #game sp_countdown -1
scoreboard players set #game sp_expected 0
scoreboard players set #game sp_current_turn 0
scoreboard players set #game sp_consecutive_passes 0
scoreboard players set #game sp_player_count 0

# Reset board
scoreboard players set #crypto sp_board_crypto 0
scoreboard players set #estate sp_board_estate 0
scoreboard players set #startup sp_board_startup 0
scoreboard players set #tech sp_board_tech 0

# Clear ALL game items
clear @a minecraft:paper[minecraft:custom_data~{sp_card:true}]
clear @a minecraft:gray_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
clear @a minecraft:red_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
clear @a minecraft:purple_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
clear @a minecraft:light_blue_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
clear @a minecraft:yellow_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
clear @a minecraft:lime_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
clear @a minecraft:carrot_on_a_stick[minecraft:custom_data~{sp_confirm_btn:true}]

# Reset player scores & tags
scoreboard players set @a sp_cards 0
scoreboard players set @a sp_cards_played 0
scoreboard players set @a sp_turn_order 0
scoreboard players set @a sp_played_crypto 0
scoreboard players set @a sp_played_estate 0
scoreboard players set @a sp_played_startup 0
scoreboard players set @a sp_played_tech 0
scoreboard players set @a sp_draw_count 0
tag @a remove sp_player
tag @a remove sp_near_board
tag @a remove sp_current_turn

tellraw @a ["",{"text":"[BG] ","color":"dark_purple","bold":true},{"text":"Full reset complete.","color":"gray"}]
