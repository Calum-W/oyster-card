require "oystercard"
describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe "#initialization" do
    it "should initialize with a balance of 0" do
      expect(oystercard.balance).to be_zero
    end
  end

  describe "#top_up" do
    it "adds a given amount to the balance" do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end
end
