# a
class Calculator
  def add(arr)
    arr.reduce { |sum, number| sum + number }
  end

  def subtract(n1, n2)
    n1 - n2
  end
end
