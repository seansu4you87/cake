require_relative 'util/stack'

class MaxStack < Stack
  def initialize
    super
    @maxes = Stack.new
  end

  def push(item)
    super item

    if @maxes.peek.nil? || @maxes.peek <= item
      @maxes.push item
    end
  end

  def pop
    popped = super

    if popped == @maxes.peek
      @maxes.pop
    end
    popped
  end

  def get_max
    @maxes.peek
  end
end
