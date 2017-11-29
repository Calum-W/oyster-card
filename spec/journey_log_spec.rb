require 'journey_log'
describe JourneyLog do
	let(:journey)  {double(:journey, finish: nil, fare: nil, complete?: true)}
	subject(:journey_log) { JourneyLog.new }
	let(:station) { double(:station)}
  describe "#touch_in" do
    it "returns a penalty fare if touched in twice" do
      journey_log.touch_in(station)
      expect(journey_log.touch_in(station)).to eq 6
    end
  end
  describe "#touch_out" do
  	it "returns the fare" do
  	  journey_log.touch_in(station)
  	  expect(journey_log.touch_out(station)).to eq 1
    end
  end 
  describe "#journeys" do
  	
  	it "returns a list of the journeys" do
  	  journey_class = double(:journey_class, new: journey)
  	  journey_log = JourneyLog.new(journey_class) 

  	  journey_log.touch_in(station)
  	  journey_log.touch_out(station)
  	  journey_log.touch_in(station)
  	  journey_log.touch_out(station)
  	  expect(journey_log.journeys).to eq [journey,journey]
  	end
  end
end
