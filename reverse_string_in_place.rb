def reverse(str)
  last = str.length - 1
  mid = last / 2
  (0..mid).to_a.each do |i|
    tmp = str[i]
    str[i] = str[last-i]
    str[last-i] = tmp
  end
  str
end
