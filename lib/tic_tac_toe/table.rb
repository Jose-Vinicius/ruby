# Classe responsavel pelo controle da tabel a
class Table
  POSITION = [[1, 2, 3], [4, 5, 6], [7, 8, 9]].freeze

  def initialize(board)
    @board = board
  end

  def print_table
    table = []
    row_separator = "\n--+---+--\n"
    col_separator = " | "

    POSITION.map do |line|
      row = line.map do |position|
        @board[position].nil? ? position : @board[position]
      end
      table.push(row.join(col_separator))
    end
    puts table.join(row_separator)
  end
end
