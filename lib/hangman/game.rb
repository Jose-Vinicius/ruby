require_relative "file_management"
require_relative "player"

# Está classe é responsavel por gerar a criação e eventos do jogo
class Game
  attr_accessor :secret, :attempts, :turn

  def initialize
    @player = Player.new
    self.attempts = []
    self.turn = 0
    self.secret = ""
  end

  def to_hide_secret(secret)
    secret.split("").map! { |letter| attempts.include?(letter) ? letter : "_" }.join(" ")
  end

  def generate_secret
    words_list = FileManagement.read_wordlist
    self.secret = words_list[rand(words_list.length)]
  end

  def player_try_letter
    answer = @player.try_letter
    attempts.push(answer)
    self.turn -= 1
  end

  def player_win?
    secret.split("").all? do |letter|
      attempts.include?(letter)
    end
  end

  def start_choice_flux(choice)
    case choice
    when 1 then player_try_letter
    when 2 then save_game
    end
  end

  def end_game
    if turn.zero?
      puts "Fim de jogo a palavra secreta era: #{secret}"
      return true
    end

    return unless player_win?

    puts "Você venceu a palavra secreta era: #{secret}"
    true
  end

  def start
    generate_secret if secret.empty?
    self.turn = secret.length + 1

    loop do
      break if end_game

      puts "Tentativas: #{attempts}\nChances restantes: #{turn}\nPalavra secreta: #{to_hide_secret(secret)}"

      choice = @player.in_game_menu_choice
      choice == 3 ? break : start_choice_flux(choice)
    end
  end

  def attempts_to_string
    attempts.map { |letter| letter }.join(",")
  end

  def save_game
    FileManagement.save_game(secret, attempts_to_string)
    puts "=====>Jogo salvo com sucesso<====="
  end

  def load_game
    load = FileManagement.load_game
    self.secret = load[:secret]
    self.attempts = load[:attempts]
    puts "=====>Jogo carregado com sucesso<====="
    start
  end

  def run
    loop do
      choice = @player.principal_menu_choice
      case choice
      when 1 then start
      when 2 then load_game
      when 3 then break
      end
    end
  end
end

g = Game.new
g.run
