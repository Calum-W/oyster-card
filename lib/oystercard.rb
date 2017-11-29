require_relative "station.rb"
require_relative "journey.rb"

class Oystercard

  attr_reader :balance, :journeys
  DEFAULT_LIMIT = 90
  DEFAULT_MIN = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(added)
    fail "Exceeds balance limit (#{DEFAULT_LIMIT})" if @balance + added > DEFAULT_LIMIT
    @balance += added
  end

  def touch_in(entry)
    fail "Insufficient balance" if @balance < DEFAULT_MIN
    deduct(current_journey.fare) if in_journey?
    @current_journey = Journey.new(entry)
    add_journey
  end

  def touch_out(station)
    @current_journey = Journey.new(nil) if !current_journey
    current_journey.finish(station)
    deduct(current_journey.fare)
  end

  def in_journey?
    !!current_journey && !current_journey.complete?
  end

  private

  def deduct(subtracted)
    @balance -= subtracted
  end

  def add_journey
    @journeys << current_journey
  end

  def current_journey
    @current_journey
  end


end
