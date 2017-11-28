require "oystercard"
describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:station) { double(:station) }
  let(:station2) { double(:station2) }

  describe "#initialization" do
    it "initializes with a balance of 0" do
      expect(oystercard.balance).to be_zero
    end
  end

  describe "#top_up" do
    before do
      oystercard.top_up(Oystercard::DEFAULT_LIMIT)
    end
    it "adds a given amount to the balance" do
      expect(oystercard.balance).to be Oystercard::DEFAULT_LIMIT
    end

    it "raises an error when an added amount makes the balance exceed 90" do
      expect{ oystercard.top_up(1) }.to raise_error("Exceeds balance limit (#{Oystercard::DEFAULT_LIMIT})")
    end
  end

  describe "#touch_in" do
    it "signals that the Oystercard has started a journey" do
      oystercard.top_up(Oystercard::DEFAULT_MIN)
      oystercard.touch_in(station)
      expect(oystercard).to be_in_journey
    end
    it "raises an error if the balance is less than 1" do
      expect{ oystercard.touch_in(station) }.to raise_error("Insufficient balance")
    end
    it "sets an entry station" do
      oystercard.top_up(Oystercard::DEFAULT_MIN)
      oystercard.touch_in(station)
      expect(oystercard.entry_station).to eq station
    end
  end

  describe "#touch_out" do
    it "signals that the Oystercard has finished a journey" do
      oystercard.touch_out(station2)
      expect(oystercard).not_to be_in_journey
    end
    it "deducts the charge from the balance" do
      oystercard.top_up(Oystercard::MINIMUM_CHARGE)
      expect { oystercard.touch_out(station2) }.to change{ oystercard.balance }.by(-Oystercard::MINIMUM_CHARGE)
    end
    it "sets an exit station" do
      oystercard.top_up(Oystercard::MINIMUM_CHARGE)
      oystercard.touch_in(station)
      oystercard.touch_out(station2)
      expect(oystercard.journeys[station]).to eq(station2)
    end
  end

  describe "#in_journey" do
    it "returns true or false" do
      expect(oystercard.in_journey?).to eq(true).or eq false
    end
  end
end
