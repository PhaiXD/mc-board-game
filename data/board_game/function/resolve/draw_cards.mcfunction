# ============================================================
# Board Game — Draw Cards (Recursive)
# Draws random cards until sp_draw_count reaches 0
# ============================================================

execute if score @s sp_draw_count matches 1.. run function board_game:give_random_card
execute if score @s sp_draw_count matches 1.. run scoreboard players remove @s sp_draw_count 1
execute if score @s sp_draw_count matches 1.. run function board_game:resolve/draw_cards
