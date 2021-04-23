require_relative "node"

class Tree
  attr_accessor :root

  def initialize(array)
    @sorted = array.sort.uniq
    @root = build_tree(@sorted, 0, @sorted.length - 1)
  end

  def build_tree(array, start, last)
    return nil if start > last
    mid = (start + last) / 2
    root = Node.new(array[mid])
    root.leftChild = build_tree(array, start, mid - 1)
    root.rightChild = build_tree(array, mid + 1, last)
    return root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.rightChild, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.rightChild
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.leftChild, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.leftChild
  end

  def insert(value)
    @sorted << value
    @sorted.sort!.uniq!
    @root = build_tree(@sorted, 0, @sorted.length - 1)
  end

  def delete(value)
    if @sorted.include?(value)
      @sorted.delete(value)
      @root = build_tree(@sorted, 0, @sorted.length - 1)
    else
      puts "That value doesn't exist in the tree!"
    end
  end

  def find(value, root = @root)
    return root if root.data == value

    if value < root.data
      find(value, root.leftChild)
    elsif value > root.data
      find(value, root.rightChild)
    end
  rescue NoMethodError
    puts "Value not found!"
  end

  def level_order(root = @root)
    queue = [root]
    values = []
    until queue.empty?
      root = queue.shift
      values << root.data
      queue.push(root.leftChild) unless root.leftChild.nil?
      queue.push(root.rightChild) unless root.rightChild.nil?
    end

    values
  end

  def inorder(root = @root, values = [])
    return if root.nil?

    inorder(root.leftChild, values)
    values << root.data
    inorder(root.rightChild, values)

    values
  end

  def preorder(root = @root, values = [])
    return if root.nil?

    values << root.data
    preorder(root.leftChild, values)
    preorder(root.rightChild, values)

    values
  end

  def postorder(root = @root, values = [])
    return if root.nil?

    postorder(root.leftChild, values)
    postorder(root.rightChild, values)
    values << root.data

    values
  end

  def height(node = @root)
    return -1 if node.nil?

    [height(node.leftChild), height(node.rightChild)].max + 1
  end

  def depth(node)
    if node.data < @root.data
      height(@root.leftChild) - height(node) + 1
    else
      height(@root.rightChild) - height(node) + 1
    end
  end

  def balanced?
    (height(@root.leftChild) - height(@root.rightChild)).abs <= 1
  end

  def rebalance
    array = level_order
    array.sort!.uniq!
    @root = build_tree(array, 0, array.length - 1)
  end
end