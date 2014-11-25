require_relative 'util/stack'

module BracketValidator
  extend self

  BRACKETS = [
    ["{", "}"],
    ["[", "]"],
    ["(", ")"],
  ]

  def validate(code)
    stack = Stack.new

    code.each_char do |char|
      if opener? char
        stack.push char
      elsif closer? char
        if stack.peek == opener_for_closer(char)
          stack.pop
        else
          return false
        end
      end
    end

    stack.count == 0
  end

  private

  def opener?(char)
    BRACKETS.map{ |pair| pair.first }.include? char
  end

  def closer?(char)
    BRACKETS.map{ |pair| pair.last }.include? char
  end

  def opener_for_closer(closer)
    raise "#{closer} is not a closer" unless closer?(closer)

    BRACKETS.find{ |pair| pair.last == closer }.first
  end
end
