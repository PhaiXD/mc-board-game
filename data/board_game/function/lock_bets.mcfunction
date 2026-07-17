# Read slot item counts
function board_game:read_bets

# DEBUG - output exactly what was locked (optional, can be removed in production)
tellraw @s ["",{"text":"[DEBUG] Your Crypto Bet locked at: "},{"score":{"name":"@s","objective":"sp_bet_crypto"}}]

# Clear slots
item replace entity @s container.19 with air
item replace entity @s container.21 with air
item replace entity @s container.23 with air
item replace entity @s container.25 with air
