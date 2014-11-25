require_relative 'util/stack'

module StockPrice
  extend self

  def best_profit(prices)
    buy_index = 0
    sell_index = 0
    profit = 0

    potential_buy_index = 0
    potential_sell_index = 0
    potential_profit = 0

    prices.each_with_index do |price, index|
      if price > prices[sell_index]
        sell_index = index
        profit = prices[sell_index] - prices[buy_index]
      end

      if price > prices[potential_sell_index]
        potential_sell_index = index
        potential_profit = prices[potential_sell_index] - prices[potential_buy_index]

        if potential_profit > profit
          buy_index = potential_buy_index
          sell_index = potential_sell_index
          profit = potential_profit
        end
      end

      if price < prices[buy_index]
        potential_buy_index = index
        potential_sell_index = index
        potential_profit = 0
      end
    end

    # puts "(#{buy_index}, #{sell_index})"
    profit
  end
end
