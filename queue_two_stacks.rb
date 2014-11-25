require_relative 'util/stack'

class Queue
  def initialize
    @in = Stack.new
    @out = Stack.new
  end

  def enqueue(item)
    @in.push item
  end

  # If @out is not empty, then simply pop from @out
  # Flush @in to @out if @out is empty
  def dequeue
    if @out.empty?
      while popped = @in.pop do
        @out.push popped
      end
    end
    @out.pop
  end

  def count
    @in.count + @out.count
  end
end
