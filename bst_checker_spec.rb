require_relative 'bst_checker'

describe BST do
  describe '.valid?' do
    it "returns whether or not a given binary search tree is valid" do
      a = BST.new(
        4,
        BST.new(
          2,
          BST.new(1, nil, nil),
          BST.new(3, nil, nil)
        ),
        BST.new(
          6,
          BST.new(5, nil, nil),
          BST.new(7, nil, nil)
        )
      )

      expect(BST.valid?(a)).to eql true

      b = BST.new(
        50,
        BST.new(
          30,
          BST.new(20, nil, nil),
          BST.new(60, nil, nil)
        ),
        BST.new(
          80,
          BST.new(70, nil, nil),
          BST.new(90, nil, nil)
        )
      )

      expect(BST.valid?(b)).to eql false
    end
  end
end
