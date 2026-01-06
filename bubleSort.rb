def bubble_sort(arr)
  loop do
      swapped = false

      (0...arr.length - 1).each do |i|
        if arr[i] > arr[i + 1]
          arr[i], arr[i + 1] = arr[i + 1], arr[i]
          swapped = true
        end
      end

      break unless swapped
    end

    arr
end

numbers = [4,3,78,2,0,2]

puts bubble_sort(numbers)
