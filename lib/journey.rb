class Journey

  PENALTY_FARE = 6
  MINIMUM_CHARGE = 1

  attr_reader :journey, :entry_station, :fare


  def initialize(entry)
    @entry_station = entry
    @complete = false
  end

  def finish(station = :no_touch)
    @exit_station = station
    @complete = true
  end

  def fare
    correct? ? MINIMUM_CHARGE : PENALTY_FARE
  end

  def complete?
    !!@complete
  end

  private

  def correct?
    !!(@entry_station && @exit_station)
  end

end
