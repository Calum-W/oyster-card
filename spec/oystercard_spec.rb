require "oystercard"
describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe "#initialization" do
    it "initializes with a balance of 0" do
      expect(oystercard.balance).to be_zero
    end
  end

  describe "#top_up" do
    it "adds a given amount to the balance" do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it "raises an error when an added amount makes the balance exceed 90" do
      oystercard.top_up(Oystercard::DEFAULT_LIMIT)
      expect{ oystercard.top_up(1) }.to raise_error("Exceeds balance limit (#{Oystercard::DEFAULT_LIMIT})")
    end
  end
end
