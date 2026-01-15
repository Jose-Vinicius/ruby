# Classe responsavel por controlar as ações do jogador
class Player
  attr_accessor :marker, :positions, :name

  def initialize(marker, name)
    self.marker = marker
    self.name = name
    self.positions = []
  end

  def insert_marker
    gets.to_i
  end

  def register_marker(position)
    p "O jogador(a) #{name} escolheu a posição #{position}"
    positions.push(position)
  end

  def check_positions
    positions
  end
end
