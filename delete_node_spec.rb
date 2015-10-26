require_relative 'delete_node'

describe Node do
  describe '.delete_node' do
    it "deletes the node, and retains the shape of the linked list" do
      a = Node.new('A')
      b = Node.new('B')
      c = Node.new('C')

      a.next = b
      b.next = c

      Node.delete_node(b)
      expect(a.next.value).to eql "C"
    end
  end
end
