def merge_sort(arr)
  return arr if arr.size <= 1

  mid = arr.size / 2
  left = arr[0...mid]
  right = arr[mid..]

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  result = []

  result << (left.first <= right.first ? left.shift : right.shift) until left.empty? || right.empty?

  result + left + right
end

p merge_sort([3, 2, 1, 4, 1, 6])
