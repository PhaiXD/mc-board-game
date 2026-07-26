# ============================================================
# Board Game — Setup & Initialization
# ============================================================

# --- Core ---
scoreboard objectives add sp_money dummy "§6Balance"
scoreboard objectives add sp_phase dummy
scoreboard objectives add sp_round dummy
scoreboard objectives add sp_confirm trigger "§aReady"
scoreboard objectives add sp_cards_played dummy
scoreboard objectives add sp_temp dummy
scoreboard objectives add sp_temp_c dummy
scoreboard objectives add sp_temp_e dummy
scoreboard objectives add sp_temp_s dummy
scoreboard objectives add sp_temp_t dummy
scoreboard objectives add sp_calc dummy
scoreboard objectives add sp_payout dummy
scoreboard objectives add sp_countdown dummy
scoreboard objectives add sp_expected dummy
scoreboard objectives add sp_use_click minecraft.used:minecraft.carrot_on_a_stick

# --- Board Indices ---
scoreboard objectives add sp_board_crypto dummy "§dCrypto"
scoreboard objectives add sp_board_estate dummy "§bEstate"
scoreboard objectives add sp_board_startup dummy "§eStartup"
scoreboard objectives add sp_board_tech dummy "§aTech"

# --- Bets ---
scoreboard objectives add sp_bet_crypto dummy
scoreboard objectives add sp_bet_estate dummy
scoreboard objectives add sp_bet_startup dummy
scoreboard objectives add sp_bet_tech dummy

# --- Balance Patch: Cap & Totals ---
scoreboard objectives add sp_money_snapshot dummy
scoreboard objectives add sp_total_crypto dummy
scoreboard objectives add sp_total_estate dummy
scoreboard objectives add sp_total_startup dummy
scoreboard objectives add sp_total_tech dummy

# --- Display ---
scoreboard objectives setdisplay sidebar sp_money

# --- Init ---
scoreboard players set #game sp_phase 0
scoreboard players set #game sp_countdown -1
scoreboard players set #game sp_expected 0
scoreboard players set #crypto sp_board_crypto 0
scoreboard players set #estate sp_board_estate 0
scoreboard players set #startup sp_board_startup 0
scoreboard players set #tech sp_board_tech 0
scoreboard players add @a sp_money 0
scoreboard players enable @a sp_confirm

tellraw @a ["",{"text":"[BG] ","color":"dark_purple","bold":true},{"text":"Datapack loaded!","color":"gray"},{"text":"\n  "},{"text":"/function board_game:spawn_board","color":"light_purple","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function board_game:spawn_board"}},{"text":" — Place board","color":"gray"},{"text":"\n  "},{"text":"/function board_game:cleanup","color":"light_purple","underlined":true,"clickEvent":{"action":"suggest_command","value":"/function board_game:cleanup"}},{"text":" — Reset all","color":"gray"}]
