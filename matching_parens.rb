require_relative 'util/stack'

module Parentheses
  extend self

  def match(string, index)
    raise "Char at index #{index} is not an opening parenthesis" if string[index] != "("

    open_count = 0
    close_count = 0
    (index...string.length).to_a.each do |i|
      if string[i] == "("
        open_count += 1
      elsif string[i] == ")"
        close_count += 1
      end

      if open_count == close_count
        return i
      end
    end

    return -1
  end
end
