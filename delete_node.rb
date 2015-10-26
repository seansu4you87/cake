class Node
  attr_accessor :value, :next

  def initialize(value, nextt = nil)
    @value = value
    @next = nextt
  end

  class << self
    def delete_node(node)
      node.value = node.next.value
      node.next = node.next.next
    end
  end
end
