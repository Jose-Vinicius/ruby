require "./lib/linkedlist/node"

class LinkedList # rubocop:disable Style/Documentation
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
      return
    end
    prev_head = @head
    @head = Node.new(value, prev_head)
  end

  def append(value)
    if @tail.nil?
      @tail = Node.new(value)
      @head = @tail
      return
    end
    prev_tail = @tail
    @tail = Node.new(value)
    prev_tail.next_node = @tail

  end

  def size
    inx = 0
    node = @head

    return 0 if @head.nil?

    loop do
      inx += 1
      break if node.next_node.nil?

      node = node.next_node
    end

    inx
  end

  def head_value
    @head.value || 0
  end

  def tail_value
    @tail.value || 0
  end

  def at(index)
    inx = 0
    node = @head
    return nil if index > size

    loop do
      inx += 1
      return node.value if inx == index

      node = node.next_node
    end
  end

  def pop
    return nil if @head.nil?

    old_head = @head
    @head = @head.next_node
    old_head.value
  end

  def contains?(value)
    node = @head
    loop do
      return false if node.next_node.nil? && node.value != value
      return true if node.value == value

      node = node.next_node
    end
  end

  def index(value)
    return nil unless contains?(value)

    inx = 0
    node = @head

    loop do
      return inx if node.value == value

      inx += 1
      node = node.next_node
    end
  end

  def to_s
    node = @head
    aux = []
    loop do
      aux.push(node.nil? ? "nil" : "( #{node.value} )")
      break if node.nil?

      node = node.next_node
    end
    aux.join(" -> ")
  end

  def print_linkedlist
    node = @head
    aux = []
    loop do
      aux.push(node.nil? ? "nil" : "( value: #{node.value}, next: #{node.next_node} )")
      break if node.nil?

      node = node.next_node
    end
    aux.join(" -> ")
  end
end

linkedlist = LinkedList.new
linkedlist.prepend(7)
linkedlist.prepend(6)
linkedlist.prepend(5)
linkedlist.append(8)
linkedlist.append(8)

puts linkedlist

# list = LinkedList.new

# list.append('dog')
# list.append('cat')
# list.append('parrot')
# list.append('hamster')
# list.append('snake')
# list.append('turtle')

# puts list

# puts "Index: #{linkedlist.index(8)}"

p linkedlist.remove_at(3)

puts linkedlist