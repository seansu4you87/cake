# Space: O(n)
# Time : O(n^2)
def v1(array)
  product_besides_int_at_index = lambda do |index|
    product = 1
    array.each_with_index do |a,i|
      product = product * a if i != index
    end
    product
  end

  product = array.reduce(1) { |p,a| p * a }
  products = []
  array.each_with_index do |a,i|
    if a == 0
      products << product_besides_int_at_index.call(i)
    else
      products << (product/a)
    end
  end
  products
end

# Space: O(3n)
# Time : O(3n)
def v2(array)
  memo_up_to = [] # position i holds product of elements up to i
  memo_up_from = [] # position i holds products of elements up from i

  product_up_to = lambda do |index,memo|
    return memo[index] if memo[index] != nil
    return 1 if index == 0

    if index == 1
      memo[index] = array.first
    else
      memo[index] = product_up_to.call(index-1, memo) * array[index-1]
    end
    memo[index]
  end

  product_up_from = lambda do |index,memo|
    return memo[index] if memo[index] != nil
    return 1 if index == array.length-1

    if index == array.length-2
      memo[index] = array.last
    else
      memo[index] = array[index+1] * product_up_from.call(index+1, memo)
    end
    memo[index]
  end

  products = []
  array.each_with_index do |_,i|
    products << product_up_to.call(i, memo_up_to) * product_up_from.call(i, memo_up_from)
  end
  products
end

# Space: O(n)
# Time : O(2n)
def v3(array)

end

def get_products_of_all_ints_except_at_index(array)
  v2(array)
end

puts get_products_of_all_ints_except_at_index([1, 7, 3, 4]).to_s
puts get_products_of_all_ints_except_at_index([0, 7, 3, 4]).to_s
puts get_products_of_all_ints_except_at_index([1, 2, 6, 5, 9]).to_s

# time:  O(n)
# space: O(n) - really O(3n).  We can do true O(n) somehow...
