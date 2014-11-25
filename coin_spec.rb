require_relative 'coin'

describe Coin do
  describe "#num_ways_to_change" do
    it "returns the amount of ways to give a certain amount of change in the denominations given" do
      expect(Coin.num_ways_to_change(4, [1,2,3])).to eql 4
    end
  end
end
