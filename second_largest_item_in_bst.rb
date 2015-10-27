require_relative 'util/binary_tree'

module SecondLargestItemInBST
  extend self

  def second_largest(node)
    second_largest_node(node).value
  end

  private

  def second_largest_node(node, parent = nil)
    # if node.right.nil?
    #   node.left || parent
    # else
    #   second_largest_node(node.right, node)
    # end

    parent = nil
    curr = node
    while curr.right != nil
      parent = curr
      curr = curr.right
    end

    if curr.left
      largest_node(curr.left)
    else
      parent
    end
  end

  def largest_node(node)
    curr = node
    while curr.right != nil
      curr = curr.next
    end
    curr
  end
end
