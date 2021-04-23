class Node
  attr_accessor :data, :leftChild, :rightChild

  def initialize(data)
    @data = data
    @leftChild = nil
    @rightChild = nil
  end
end