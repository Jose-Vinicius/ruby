def cifraCesar(text, desloc)
    alfabeto = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm','n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

    textArray= text.split('')
    aux = []
    textArray.each do |letra|
        posicao = alfabeto.index(letra)
        if posicao.nil?
            aux.push(letra) 
            next
        end

        mod = desloc > 25 ? (desloc % 52) - alfabeto.length : desloc % 52

        if mod < 0
            aux.push(alfabeto[mod+posicao])
            next
        end
        aux.push(alfabeto[posicao+mod])
        
    end

    return aux.join
end

desloc = 1

text = 'Hello World'

puts cifraCesar(text, desloc)



