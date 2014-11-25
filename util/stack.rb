class Stack
  def initialize
    @items = []
  end

  def push(item)
    @items << item
  end

  def pop
    return nil if @items.empty?

    @items.pop
  end

  def peek
    return nil if @items.empty?

    @items.last
  end

  def count
    @items.count
  end

  def empty?
    count == 0
  end
end
