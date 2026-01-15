def stockPicker(arr)
  min_day = 0
  min_price = arr.first
  best_day = []
  max_profit = 0

  arr.each_with_index do |price, day|
    if price < min_price
      min_day = day
      min_price = price
      next
    end

    price -= min_price

    if price > max_profit
      max_profit = price
      best_day = [min_day, day]
    end
  end
  best_day
end

puts stockPicker([17, 3, 6, 9, 15, 8, 6, 1, 10])
