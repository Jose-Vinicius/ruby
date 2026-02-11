def fibs_recursive(range, arr, inx = 1)
  return arr if arr.length == range # Se o array tiver 8 elementos ira retornar o mesmo

  arr.push(arr[inx - 1] + arr[inx]) # Adiciona o proximo elemento no array, com o indice inicial sendo 1
  inx += 1 # soma mais 1 no indice
  fibs_recursive(range, arr, inx) # chama a mesma função novamente mas passando o array alterado e o proximo indice, isso se repete até  N elementos
end

def fibs_loop(range)
  arr = [0, 1]
  i = 1
  loop do
    arr.push(arr[i - 1] + arr[i])
    return arr if arr.length == range

    i += 1
  end
end
