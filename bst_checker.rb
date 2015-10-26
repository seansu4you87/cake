class BST
  attr_accessor :value, :left, :right

  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
  end

  def to_a
    left_values = left.nil? ? [] : left.to_a
    right_values = right.nil? ? [] : right.to_a

    left_values + [value] + right_values
  end

  class << self
    def valid?(bst)
      values = bst.to_a
      (0..(values.length-2)).to_a.each do |i|
        cur = values[i]
        nex = values[i+1]
        return false if cur > nex
      end

      true

      # if bst.left
      #   return false unless valid?(bst.left)
      #   return false unless bst.left.value <= bst.value
      # end

      # if bst.right
      #   return false unless valid?(bst.right)
      #   return false unless bst.right.value >= bst.value
      # end

      # true
    end
  end
end
