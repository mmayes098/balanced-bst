require_relative "node"

class Tree
  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    array.sort!.uniq!
    mid_idx = array.length / 2
    return array[mid_idx]
  end
end