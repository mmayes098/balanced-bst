require_relative "node"

class Tree
  def initialize(array)
    array.sort!.uniq!
    @root = build_tree(array, 0, array.length - 1)
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
end