require_relative 'bracket_validator'

describe BracketValidator do
  it "validates properly" do
    expect(BracketValidator.validate("{ [ ] ( ) }")).to eql true
    expect(BracketValidator.validate("{ [ ( ] ) }")).to eql false
    expect(BracketValidator.validate("{ [ }")).to eql false
    expect(BracketValidator.validate("]{}[")).to eql false
    expect(BracketValidator.validate("[({})")).to eql false
  end

  context "vertical bars" do
    it "validates properly" do
      expect(BracketValidator.validate("|")).to eql false
      expect(BracketValidator.validate("{|}")).to eql false
      expect(BracketValidator.validate("|{}|")).to eql false # not sure about this

      expect(BracketValidator.validate("||")).to eql true
      expect(BracketValidator.validate("{||}")).to eql true
    end
  end
end
