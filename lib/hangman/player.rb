require_relative "menu"

# a
class Player
  ALPHABET = [*("a".."z")]

  private

  def valide_menu_answer?(answer, limit_range)
    (1..limit_range).cover?(answer) || false
  end

  public

  def principal_menu_choice
    loop do
      puts Menu.principal
      answer = gets.to_i
      return answer if valide_menu_answer?(answer, 3)

      puts "Resposta invalida, por favor escolha uma das respostas corretas"
    end
  end

  def in_game_menu_choice
    loop do
      puts Menu.in_game
      answer = gets.to_i
      return answer if valide_menu_answer?(answer, 3)

      puts "Resposta invalida, por favor escolha uma das respostas corretas"
    end
  end

  def try_letter
    puts "Informe uma letra: "
    loop do
      answer = gets.to_s.chomp.downcase
      return answer if ALPHABET.include?(answer)

      puts "Resposta Invalida, deve ser UMA letra"
    end
  end
end
