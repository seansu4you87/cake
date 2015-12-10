require_relative 'inflight_entertainment'

describe InflightEntertainment do
  let(:movies) { [
    120,
    129,
    164,
    100,
    102
  ] }
  let(:flight_length) { 249 }
  subject { InflightEntertainment.entertained?(flight_length, movies) }

  it "passes" do
    expect(subject).to eql true
  end
end