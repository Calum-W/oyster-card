require "journey"
describe Journey do

  subject(:journey) { described_class.new(station) }
  let(:station) { double(:station) }

  describe "#finish" do
    it "makes a journey complete" do
      journey.finish(station)
      expect(journey.complete?).to eq true
    end
  end
end
