# ============================================================
# Board Game — Play Card (entry point / documentation)
# Card playing is triggered automatically by right-clicking a
# zone while holding a Market Card. This file is a reference.
# ============================================================
# Actual play_card logic is in:
#   board_game:play_card/crypto
#   board_game:play_card/estate
#   board_game:play_card/startup
#   board_game:play_card/tech
#
# The card's custom_data {sp_card:true, sp_value:<int>} is read
# to determine the effect on the project's Net Index.
# ============================================================

tellraw @s [{"text":"[Board Game] ","color":"dark_purple","bold":true},{"text":"Hold a Market Card and right-click a zone to play it. The card's value will change the project's Net Index.","color":"gray"}]
