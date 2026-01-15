dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(words, dictionary)
  wordsArray = words.downcase.split
  wordsCount = []
  dictionary.each do |word|
    wordsArray.each do |wordL|
      wordsCount.push(word) if wordL.include?(word)
    end
  end
  result = wordsCount.each_with_object(Hash.new(0)) do |count, word|
    word[count] += 1
  end

  puts result
end

substrings("Howdy partner, sit down! How's it going?", dictionary)

# solucão melhorada pelo gpt
# def substrings(text, dictionary)
#   words = text.downcase.scan(/\w+/)

#   dictionary.each_with_object(Hash.new(0)) do |dict_word, result|
#     words.each do |word|
#       result[dict_word] += 1 if word.include?(dict_word)
#     end
#   end
# end

# dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner", "sit"]

# puts substrings("Howdy partner, sit down! How's it going?", dictionary)
