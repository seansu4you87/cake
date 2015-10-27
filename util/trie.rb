# from compress_url_list problem
class Trie
  class Node
    attr_reader :value, :children

    def initialize(value)
      @value = value
      @children = {}
    end
  end

  def initialize
    @root = Node.new(nil)
  end

  def set(word)
    curr = @root
    word.each_char do |c|
      curr.children[c] ||= Node.new(c)
      curr = curr.children[c]
    end
    curr.children['*'] ||= Node.new('*')
    true
  end

  def set?(word)
    curr = @root
    word.each_char do |c|
      return false if curr.children[c] == nil
      curr = curr.children[c]
    end

    if curr.children['*'] != nil
      true
    else
      false
    end
  end
end
