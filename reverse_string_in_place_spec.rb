require_relative 'reverse_string_in_place'

describe "#reverse" do
  it "reverses a string" do
    expect(reverse("hello")).to eql "olleh"
  end
end
