require_relative "table"

# classe responsavel pelo controle do jogo
class Game
  COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  attr_accessor :board, :players, :actual_player, :turn

  def initialize(player1, player2)
    self.board = Array.new(10)
    self.players = [player1, player2]
    @table = Table.new(board)
    self.actual_player = players[0]
    self.turn = 1
  end

  def print_table
    @table.print_table
  end

  def change_player_order
    players.reverse!
    self.actual_player = players[0]
  end

  def player_win
    puts "#{actual_player.name}: #{actual_player.positions}"
    if COMBINATIONS.include?(actual_player.positions)
      print_table
      p "#{actual_player.name} Wins"
      return true
    end

    change_player_order
  end

  def insert_marker
    actual_player.insert_marker
  end

  def free_positions
    board.length - turn
  end

  def check_free_position(marker)
    unless board[marker].nil?
      p "posição já em uso escolha outra"
      false
    end
    true
  end

  def register_marker(marker)
    actual_player.register_marker(marker)

    board[marker] = actual_player.marker

    self.turn += 1
  end

  def draw?
    puts "Empate" if free_positions.zero?
  end

  def run_game
    loop do
      draw? ? break : "Jogador Atual: #{actual_player.name}"

      print_table

      marker = insert_marker

      check_free_position(marker) || next

      register_marker(marker)

      break if player_win == true
    end
  end
end
