class Oystercard

  attr_reader :balance
  DEFAULT_LIMIT = 90
  DEFAULT_MIN = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(added)
    fail "Exceeds balance limit (#{DEFAULT_LIMIT})" if @balance + added > DEFAULT_LIMIT
    @balance += added
  end

  def deduct(subtracted)
    @balance -= subtracted
  end

  def touch_in
    fail "Insufficient balance" if @balance < DEFAULT_MIN
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
