# ============================================================
# Board Game — Setup & Initialization
# ============================================================

# --- Core ---
scoreboard objectives add sp_cards dummy "§6Cards"
scoreboard objectives add sp_phase dummy
scoreboard objectives add sp_round dummy

scoreboard objectives add sp_cards_played dummy
scoreboard objectives add sp_temp dummy
scoreboard objectives add sp_temp_c dummy
scoreboard objectives add sp_temp_e dummy
scoreboard objectives add sp_temp_s dummy
scoreboard objectives add sp_temp_t dummy
scoreboard objectives add sp_calc dummy
scoreboard objectives add sp_countdown dummy
scoreboard objectives add sp_expected dummy
scoreboard objectives add sp_use_click minecraft.used:minecraft.carrot_on_a_stick

# --- Board Indices ---
scoreboard objectives add sp_board_crypto dummy "§dCrypto"
scoreboard objectives add sp_board_estate dummy "§bEstate"
scoreboard objectives add sp_board_startup dummy "§eStartup"
scoreboard objectives add sp_board_tech dummy "§aTech"

# --- Turn System ---
scoreboard objectives add sp_turn_order dummy
scoreboard objectives add sp_current_turn dummy
scoreboard objectives add sp_consecutive_passes dummy
scoreboard objectives add sp_player_count dummy

# --- Per-Player Plays This Round ---
scoreboard objectives add sp_played_crypto dummy
scoreboard objectives add sp_played_estate dummy
scoreboard objectives add sp_played_startup dummy
scoreboard objectives add sp_played_tech dummy
scoreboard objectives add sp_draw_count dummy

# --- Display ---
scoreboard objectives setdisplay sidebar sp_cards

# --- Init ---
scoreboard players set #game sp_phase 0
scoreboard players set #game sp_countdown -1
scoreboard players set #game sp_expected 0
scoreboard players set #crypto sp_board_crypto 0
scoreboard players set #estate sp_board_estate 0
scoreboard players set #startup sp_board_startup 0
scoreboard players set #tech sp_board_tech 0
scoreboard players add @a sp_cards 0


tellraw @a ["",{"text":"[BG] ","color":"dark_purple","bold":true},{"text":"Datapack loaded!","color":"gray"},{"text":"\n  "},{"text":"/function board_game:spawn_board","color":"light_purple","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function board_game:spawn_board"}},{"text":" — Place board","color":"gray"},{"text":"\n  "},{"text":"/function board_game:cleanup","color":"light_purple","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function board_game:cleanup"}},{"text":" — Reset all","color":"gray"}]
