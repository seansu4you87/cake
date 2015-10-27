require_relative 'find_rotation_point'

describe FindRotationPoint do
    let(:words) { [
      'ptolemaic',      # 0  7
      'retrograde',     # 1  8
      'supplant',       # 2  9
      'undulate',       # 3  10
      'xenoepist',      # 4  11
      'asymptote',      # 5  1 <-- rotates here!
      'babka',          # 6  2
      'banoffee',       # 7  3
      'engender',       # 8  4
      'karpatka',       # 9  5
      'othellolagkage', # 10 6
    ] }

    subject { FindRotationPoint.find(words) }

    it "finds the rotation point" do
      expect(subject).to eql 5
    end
end
