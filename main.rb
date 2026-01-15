# Tic Tac Toe
require_relative "lib/tic_tac_toe/player"
require_relative "lib/tic_tac_toe/game"

p1 = Player.new("X", "João")

p2 = Player.new("O", "Maria")

game = Game.new(p1, p2)

game.run_game
