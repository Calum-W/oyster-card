class Oystercard

  attr_reader :balance
  DEFAULT_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(added)
    fail "Exceeds balance limit (#{DEFAULT_LIMIT})" if @balance + added > DEFAULT_LIMIT
    @balance += added
  end

end
