require_relative 'util/binary_tree'

module BSTChecker
  extend self

  def is_bst?(node)
    values = []
    tree_to_array(node, values)

    sorted = true
    prev = -1_000_000_000_000
    values.each do |val|
      if prev > val
        sorted = false
        break
      end

      prev = val
    end

    sorted
  end

  private

  def tree_to_array(node, array)
    if !node.nil?
      tree_to_array(node.left, array)
      array << node.value
      tree_to_array(node.right, array)
    end
  end
end
