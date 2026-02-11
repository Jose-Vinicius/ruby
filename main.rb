# Tic Tac Toe
# require_relative "lib/tic_tac_toe/player"
# require_relative "lib/tic_tac_toe/game"

# p1 = Player.new("X", "João")

# p2 = Player.new("O", "Maria")

# game = Game.new(p1, p2)

# game.run_game

# combination = [2,2,3,4]

# t = [1,2,3,4].map.with_index do |n, i|
#   if combination.include?(n)
#     returncombination[i] == n ? "C" : "P"
#   end

# end

# secret = "black"
# attempts = %w[b a p]

# p secret.split("").map! { |letter| attempts.include?(letter) ? letter : "_" }.join(" ")

# puts case { a: 'ant', b: 'ball' }
# in { a: 'ant' }
#   'this will match'
# in { a: 'ant', b: 'ball' }
#   'this will never be reached'
# end

# def logger
#   yield
#   "batata 2"
# end

# logger { p "batata 3"}

# logger do
#   p "batata"
# end

# @transactions = [10, -15, 25, 30, -24, -70, 999]

# def transaction_statement
#   @transactions.each do |transaction_function|
#     yield transaction_function # You just yield the transaction amount.
#   end
# end

# transaction_statement do |transaction_block|
#   p "%0.2f" % transaction_block # The bank that calls the method can define how it is handled.
# end
# #=> ["10.00", "-15.00", "25.00", "30.00", "-24.00", "-70.00", "999.00"]
#
alphabet
columns_letter = 

("A"..6).map { |r| puts r}