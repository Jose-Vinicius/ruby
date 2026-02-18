# a
class Hashmap
  attr_accessor :load_factor, :capacity, :buckets

  def initialize(load_factor = 0.75, capacity = 16)
    self.load_factor = load_factor
    self.capacity = capacity
    @buckets = Array.new(capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    index = hash(key) % capacity
    raise IndexError if index.negative? || index >= @buckets.length

    buckets[index] = [key, value]
    rebalance
  end

  def get(key)
    index = hash(key) % capacity
    return nil if index.negative? || index >= @buckets.length

    index.nil? || @buckets[index]
  end

  def remove(key)
    index = hash(key) % capacity
    return nil if index.negative? || index >= @buckets.length

    old_value = buckets[index]
    buckets[index] = nil
    old_value
  end

  def has?(key)
    index = hash(key) % capacity
    return nil if index.negative? || index >= @buckets.length

    buckets[index].nil? ? false : true
  end

  def length
    buckets.compact.length
  end

  def clear
    @buckets.map! { nil }
  end

  def values
    buckets.compact.map { |_key, value| value }
  end

  def entries
    @buckets.compact
  end

  def rebalance
    return unless @buckets.compact.size >= (capacity * load_factor)

    old_buckets = @buckets.compact
    self.capacity = capacity * 2
    @buckets = Array.new(capacity)
    old_buckets.map { |key, value| set(key, value) }
  end
end

a = Hashmap.new

a.set("apple", "red")
a.set("banana", "yellow")
a.set("carrot", "orange")
a.set("dog", "brown")
a.set("elephant", "gray")
a.set("frog", "green")

p a.buckets.size

a.set("grape", "purple")
a.set("ice cream", "white")
a.set("hat", "black")
a.set("jacket", "blue")
a.set("kite", "pink")
a.set("lion", "golden")
a.set("month", "a")
a.set("nothing", "golden")
a.set("octapus", "a")
a.set("parking", "a")
a.set("moon", "a")

p a.buckets

p a.buckets.size
