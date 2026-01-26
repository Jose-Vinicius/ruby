# Modulo para leitura e tratamento dos arquivos
module FileManagement
  SAVE_PATH = File.join(__dir__, "save.txt")
  WORD_LIST = File.join(__dir__, "words_list.txt")
  def self.read_wordlist
    words = []

    File.readlines(WORD_LIST).each do |word|
      word.chomp.length.between?(5, 12) ? words.push(word.chomp) : next
    end

    words
  end

  def self.save_game(secret_word, attempts)
    File.new SAVE_PATH, "w" unless File.exist?(SAVE_PATH)
    save_file = File.open(SAVE_PATH, "w")
    save_file.puts "#{secret_word}\n#{attempts}"
    save_file.close
  end

  def self.load_game
    load = []
    return "Nenhum save encontrado" unless File.exist?(SAVE_PATH)

    load_file = File.open(SAVE_PATH)
    load_file.each do |line|
      load.push(line.chomp)
    end
    load_file.close
    { "secret": load[0], "attempts": load[1].nil? ? "" : load[1].split(",") }
  end
end

# puts FileManagement.save_game("black", "b, a, p"])
