require_relative 'queue_two_stacks'

describe Queue do
  describe '#enqueue' do
    it "adds an element to the end" do
      q = Queue.new
      q.enqueue 1
      q.enqueue 2
      q.enqueue 3
      q.enqueue 4
      q.enqueue 5
      expect(q.count).to eql 5
    end
  end

  describe '#dequeue' do
    it "takes an element from the beginning" do
      q = Queue.new
      q.enqueue 1
      q.enqueue 2
      q.enqueue 3
      expect(q.dequeue).to eql 1
      expect(q.count).to eql 2
      q.enqueue 4
      q.enqueue 5
      expect(q.dequeue).to eql 2
      expect(q.count).to eql 3
    end
  end
end
