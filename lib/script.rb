require_relative "tree"

tree = Tree.new(Array.new(15) { rand(1..100) })

tree.pretty_print

puts "\nIs the tree balanced?"
if tree.balanced?
  puts "\nThe tree is balanced!"
else
  puts "\nThe tree is not balanced!"
end

puts "\nLevel-order array: #{tree.level_order}"
puts "\nPre-order array: #{tree.preorder}"
puts "\nIn-order array: #{tree.inorder}"
puts "\nPost-order array: #{tree.postorder}"

puts "\nAdding numbers 101 - 105"
tree.insert(101)
tree.insert(102)
tree.insert(103)
tree.insert(104)
tree.insert(105)

puts "\n"
tree.pretty_print

puts "\nIs the tree still balanced?"
if tree.balanced?
  puts "\nThe tree is balanced!"
else
  puts "\nThe tree is not balanced!"
  tree.rebalance
end

puts "\nNew Level-order array: #{tree.level_order}"
puts "\nNew Pre-order array: #{tree.preorder}"
puts "\nNew In-order array: #{tree.inorder}"
puts "\nNew Post-order array: #{tree.postorder}"