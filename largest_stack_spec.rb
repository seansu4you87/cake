require_relative 'largest_stack'

describe MaxStack do
  describe '#get_max' do
    subject { MaxStack.new }

    it "should return the largest element in the stack" do
      expect(subject.get_max).to eql nil
      subject.push 5
      expect(subject.get_max).to eql 5
      subject.push 1
      expect(subject.get_max).to eql 5
      subject.push 2
      expect(subject.get_max).to eql 5
      subject.push 6
      expect(subject.get_max).to eql 6
      subject.push 3
      expect(subject.get_max).to eql 6
    end

    it "should return largest element if pushed in increasing order" do
      subject.push 1
      subject.push 2
      subject.push 3
      subject.push 4
      expect(subject.get_max).to eql 4
    end

    it "should not remove the element" do
      subject.get_max
      expect(subject.count).to eql 0
      subject.push 1
      subject.get_max
      expect(subject.count).to eql 1
      subject.push 1
      subject.get_max
      expect(subject.count).to eql 2
    end
  end
end
