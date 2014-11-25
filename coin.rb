module Coin
  extend self

  # We can do this by taking the first coin, and finding the # ways to make change for the amount without that coin,
  # and adding that to the # ways to make change for (amount - coin) with all the coins
  #
  # Example:
  # (4, [1,2,3])
  # (4, [2,3]) + (3, [1,2,3])
  # (4, [3]) + (2, [2,3]) + (3, [2,3]) + (2, [1,2,3])
  # (4, []) + (1, [3]) + (2, [3]) + (0, [2,3]) + (3, [3]) + (1, [2,3]) + (2, [2,3]) + (1, [1,2,3])
  # 0 + (1, []) + (-2, [3]) + (2, []) + (-1, [3]) + 1 + (3, []) + (0, [3]) + (1, [3]) + (-1, [2,3]) + (2, [3]) + (0, [2,3]) + (1, [2,3]) + (0, [1,2,3])
  # 0 + 0 + 0 + 0 + 0 + 1 + 0 + 1 + (1, []) + (-2, [3]) + 0 + (2, []) + (-1, [3]) + 1 + (1, [3]) + (-1, [2,3]) + 1
  # 0 + 0 + 0 + 0 + 0 + 1 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 1 + (1, []) + (-2, [3]) + 0 + 1
  # 0 + 0 + 0 + 0 + 0 + 1 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 1
  # 1 + 1 + 1 + 1
  # 4

  def cheatsheet
    @@cheatseat ||= {}
  end

  def num_ways_to_change(amount, coins)
    # memoized_recursive(amount, coins)
    # bottom_up(amount, coins)
    bottom_up_2(amount, coins)
  end

  # memoized, recursive
  def memoized_recursive(amount, coins)
    puts "(#{amount}, #{coins.to_s})"
    return 1 if amount == 0
    return 0 if amount < 0
    return 0 if coins.empty?

    coin = coins.first
    cheatsheet[[amount, coins[1..-1]]] ||= num_ways_to_change(amount, coins[1..-1])
    cheatsheet[[amount - coin, coins]] ||= num_ways_to_change(amount - coin, coins)

    cheatsheet[[amount, coins[1..-1]]] + cheatsheet[[amount - coin, coins]]
  end

  # bottom up
  def bottom_up(amount, coins)
    ways_of_making_n_cents = [0] * (amount + 1)
    ways_of_making_n_cents[0] = 1

    puts "(c, h, r)"
    puts "-" * 9

    coins.each do |coin|
      (coin..amount).to_a.each do |higher_amount|
        higher_amount_remainder = higher_amount - coin
        puts "(#{coin}, #{higher_amount}, #{higher_amount_remainder})"
        ways_of_making_n_cents[higher_amount] += ways_of_making_n_cents[higher_amount_remainder]
      end
    end

    puts "\n"
    puts (0..amount).to_a.to_s
    puts "-" * 15
    puts ways_of_making_n_cents.to_s
    ways_of_making_n_cents[amount]
  end

  def bottom_up_2(amount, coins)
    ways = [0] * (amount + 1)
    ways[0] = 1

    coins.each do |coin|
      (coin..amount).to_a.each do |higher|
        remainder = higher - coin

        ways[higher] += ways[remainder]
      end
    end

    ways[amount]
  end
end
