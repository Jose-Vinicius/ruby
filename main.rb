require_relative "player"
require_relative "game"

p1 = Player.new("X", "João")
p2 = Player.new("O", "Maria")

game = Game.new(p1, p2)

game.run_game
