require_relative 'compress_url_list'

describe Trie do
  it "can add words to the trie and check for existence" do
    t = Trie.new
    t.set("hello")
    expect(t.set? "hello").to eql true
    expect(t.set? "hell").to eql false
    expect(t.set? "world").to eql false
  end
end
