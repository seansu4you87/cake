require_relative 'bst_checker'

describe BSTChecker do
  describe '#is_bst?' do
    let(:tree) do
      left = BinaryTree::Node.new(5, BinaryTree::Node.new(5))
      right = BinaryTree::Node.new(12, nil, BinaryTree::Node.new(15))
      BinaryTree::Node.new(10, left, right)
    end
    subject { BSTChecker.is_bst?(tree) }

    context "valid BST" do
      it "returns true" do
        expect(subject).to eql true
      end
    end

    context "invalid BST" do
      let(:tree) do
        left = BinaryTree::Node.new(5, BinaryTree::Node.new(6))
        right = BinaryTree::Node.new(12, nil, BinaryTree::Node.new(15))
        BinaryTree::Node.new(10, left, right)
      end

      it "returns false" do
        expect(subject).to eql false
      end

      context "left subtree is valid but has larger right than the root" do
        let(:tree) do
          left = BinaryTree::Node.new(5, BinaryTree::Node.new(4), BinaryTree::Node.new(20))
          right = BinaryTree::Node.new(12, nil, BinaryTree::Node.new(15))
          BinaryTree::Node.new(10, left, right)
        end

        it "returns false" do
          expect(subject).to eql false
        end
      end
    end

    context "tree with no children" do
      let(:tree) { BinaryTree::Node.new(1, nil, nil) }

      it "returns true" do
        expect(subject).to eql true
      end
    end
  end
end
