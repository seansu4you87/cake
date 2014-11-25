require_relative 'matching_parens'

describe Parentheses do
  describe "#match" do
    it "returns the index of the matching parenthese" do
      input = "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."
      expect(Parentheses.match(input, 10)).to eql 79
    end
  end
end
