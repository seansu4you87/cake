require_relative 'stock_price'

describe StockPrice do
  describe '#best_profit' do
    it "returns the maximum profit potential given a list of stock prices" do
      expect(StockPrice.best_profit([500, 500, 300, 300, 300, 301, 302, 400, 600, 900])).to eql 600
      expect(StockPrice.best_profit([500, 500, 300, 300, 300, 300, 300, 200, 100, 100])).to eql 0
      expect(StockPrice.best_profit([500, 200, 100, 600])).to eql 500
      expect(StockPrice.best_profit([500, 1000, 100, 500])).to eql 500
    end
  end
end
