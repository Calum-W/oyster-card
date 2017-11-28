class Oystercard

  attr_reader :balance, :entry_station
  DEFAULT_LIMIT = 90
  DEFAULT_MIN = 1
  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up(added)
    fail "Exceeds balance limit (#{DEFAULT_LIMIT})" if @balance + added > DEFAULT_LIMIT
    @balance += added
  end

  def touch_in(entry)
    fail "Insufficient balance" if @balance < DEFAULT_MIN
    @entry_station = entry
  end

  def touch_out
    @entry_station = nil
    deduct(MINIMUM_CHARGE)
  end

  def in_journey?
    @entry_station != nil
  end

  private

  def deduct(subtracted)
    @balance -= subtracted
  end

end
