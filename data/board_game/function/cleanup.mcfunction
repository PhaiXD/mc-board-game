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

# Reset board
scoreboard players set #crypto sp_board_crypto 0
scoreboard players set #estate sp_board_estate 0
scoreboard players set #startup sp_board_startup 0
scoreboard players set #tech sp_board_tech 0

# Clear ALL game items
clear @a minecraft:gold_nugget[minecraft:custom_data~{sp_money:true}]
clear @a minecraft:diamond[minecraft:custom_data~{sp_money:true}]
clear @a minecraft:paper[minecraft:custom_data~{sp_card:true}]
clear @a minecraft:gray_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
clear @a minecraft:red_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
clear @a minecraft:purple_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
clear @a minecraft:light_blue_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
clear @a minecraft:yellow_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
clear @a minecraft:lime_stained_glass_pane[minecraft:custom_data~{sp_ui:true}]
clear @a minecraft:carrot_on_a_stick[minecraft:custom_data~{sp_confirm_btn:true}]

# Reset player scores & tags
scoreboard players set @a sp_money 0
scoreboard players set @a sp_cards_played 0
scoreboard players set @a sp_confirm 0
scoreboard players set @a sp_bet_crypto 0
scoreboard players set @a sp_bet_estate 0
scoreboard players set @a sp_bet_startup 0
scoreboard players set @a sp_bet_tech 0
scoreboard players set @a sp_money_snapshot 0
scoreboard players set #totals sp_total_crypto 0
scoreboard players set #totals sp_total_estate 0
scoreboard players set #totals sp_total_startup 0
scoreboard players set #totals sp_total_tech 0
tag @a remove sp_player
tag @a remove sp_near_board

tellraw @a ["",{"text":"[BG] ","color":"dark_purple","bold":true},{"text":"Full reset complete.","color":"gray"}]
