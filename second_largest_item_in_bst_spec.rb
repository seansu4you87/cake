require_relative 'second_largest_item_in_bst'

describe SecondLargestItemInBST do
  describe "#second_largest" do
    let(:tree) do
      # 5 5 10 12 15
      left = BinaryTree::Node.new(5, BinaryTree::Node.new(5))
      right = BinaryTree::Node.new(12, nil, BinaryTree::Node.new(15))
      BinaryTree::Node.new(10, left, right)
    end

    subject { SecondLargestItemInBST.second_largest(tree) }

    it "does it" do
      expect(subject).to eql 12
    end
  end
end
