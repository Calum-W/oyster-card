require "oystercard"
describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe "#initialization" do
    it "should initialize with a balance of 0" do
      expect(oystercard.balance).to be_zero
    end
  end
end
