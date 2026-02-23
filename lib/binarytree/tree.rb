require "./lib/binarytree/node"
# a
class Tree
  def sort_array(arr)
    arr.sort
  end

  def remove_duplicate(arr)
    arr.uniq
  end

  def create_bst(arr, first, last)
    return nil if first > last

    mid = first + (last - first) / 2
    root = Node.new(arr[mid])

    root.left = create_bst(arr, first, mid - 1)
    root.right = create_bst(arr, mid + 1, last)

    root
  end

  def sorted_array_to_bst(arr)
    arr = sort_array(remove_duplicate(arr)).compact
    @root = create_bst(arr, 0, arr.size - 1)
  end

  def pretty_print(node = @root, prefix = "", is_left: true)
    return unless node

    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false)
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true)
  end

  def include_recursive?(value, node = @root)
    return false if node.nil?

    return true if node.data == value

    value > node.data ? include_recursive?(value, node.right) : include_recursive?(value, node.left)
  end

  def include_iterative?(value)
    node = @root
    until node.nil?
      return true if value == node.data

      node = value < node.data ? node.left : node.right
    end

    false
  end

  def insert(value, node = @root)
    return if include_recursive?(value)

    return Node.new(value) if node.nil?

    value < node.data ? node.left = insert(value, node.left) : node.right = insert(value, node.right)

    node
  end

  def get_sucessor(curr)
    curr = curr.right
    curr = curr.left while !curr.nil? && !curr.left.nil?
    curr
  end

  def delete(value, node = @root)
    return node if node.nil?

    if node.data > value
      node.left = delete(value, node.left)
    elsif node.data < value
      node.right = delete(value, node.right)
    else
      return node.left if node.right.nil?

      return node.right if node.left.nil?

      succ = get_sucessor(node)
      node.data = succ.data
      node.right = delete(succ.data, node.right)
    end
    node
  end

  def heigth(value, node = @root)
    return nil if node.nil?
    return heigth_node(node) if value == node.data

    value < node.data ? heigth(value, node.left) : heigth(value, node.right)
  end

  def depth_level(value, node = @root, depth = 0)
    return nil if node.nil?

    return depth if value == node.data

    value < node.data ? depth_level(value, node.left, depth + 1) : depth_level(value, node.right, depth + 1)
  end

  def level_order(root = @root)
    return to_enum(:level_order) unless block_given?
    return if root.nil?

    queue = [root]

    until queue.empty?
      level_size = queue.size

      level_size.times do
        node = queue.shift
        yield(node.data)

        queue << node.left if node.left
        queue << node.right if node.right
      end
      self
    end
  end

  def pre_order(root = @root, &block)
    return to_enum(:pre_order, root) unless block_given?
    return if root.nil?

    yield(root.data)
    pre_order(root.left, &block)
    pre_order(root.right, &block)

    self unless block_given?
  end

  def in_order(root = @root, &block)
    return to_enum(:in_order, root) unless block_given?
    return if root.nil?

    in_order(root.left, &block)
    yield(root.data)
    in_order(root.right, &block)

    self unless block_given?
  end

  def post_order(root = @root, &block)
    return to_enum(:post_order, root) unless block_given?
    return if root.nil?

    post_order(root.left, &block)
    post_order(root.right, &block)
    yield(root.data)

    self unless block_given?
  end

  def heigth_node(node)
    return -1 if node.nil?

    left = heigth_node(node.left)
    right = heigth_node(node.right)

    [left, right].max + 1
  end

  def balanced?(node = @root)
    return true if node.nil?

    left = heigth_node(node.left)
    right = heigth_node(node.right)

    return false if (left - right).abs > 1

    balanced?(node.left) && balanced?(node.right)
  end

  def rebalance
    arr = []
    send(:pre_order) { |value| arr << value }

    sorted_array_to_bst(arr)
  end
end

a = Tree.new
arr = [20, 21, 30, 40, 50, 60, 70, 80]

a.sorted_array_to_bst(arr)
a.insert(22)
a.insert(23)
a.insert(24)

# a.level_order { |value| print "#{value} " }

# a.pre_order { |value| print "#{value} " }
# p "\n"
# a.in_order { |value| print "#{value} " }
# p "\n"
# a.post_order { |value| print "#{value} " }

p a.heigth(20)
p a.depth_level(20)

p a.balanced?

a.pretty_print

a.rebalance

a.pretty_print
