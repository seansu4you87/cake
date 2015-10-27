# Remove http, http, //:, www,
require_relative 'util/trie'

class URLCache
  def initialize
    @trie = Trie.new
  end

  def add(url)
    @trie.set(url)
  end
end

# class Trie
#   class Node
#     attr_reader :value, :children
#     def initialize(value)
#       @value = value
#       @children = {}
#     end
#   end

#   def initialize
#     @root = Trie::Node.new(nil)
#   end

#   def set(word)
#     node = @root
#     while word.length > 0 do
#       head = word[0,1]
#       node = (node.children[head] ||= Node.new(head))
#       word = word[1..-1]
#     end
#     node.children["*"] ||= Node.new("*")
#     true
#   end

#   def set?(word)
#     node = @root
#     while word.length > 0 do
#       head = word[0,1]
#       node = node.children[head]
#       return false if node.nil?
#       word = word[1..-1]
#     end
#     node.children["*"] != nil
#   end

#   def to_s
#     @root.children.to_s
#   end
# end
