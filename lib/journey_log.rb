require_relative "journey.rb"
class JourneyLog
  def initialize (journey_class = Journey)
  	@journey_class = journey_class
  	 @journeys = []
  end

  def touch_in(entry)
  	fare = in_journey? ? current_journey.fare : 0
    @current_journey = @journey_class.new(entry)
    add_journey
    fare
  end

  def touch_out(station)
    @current_journey = @journey_class.new(nil) if !current_journey
    current_journey.finish(station)
    current_journey.fare
  end

  def journeys
  	@journeys
  end


  def in_journey?
    !!current_journey && !current_journey.complete?
  end

private

  def add_journey
    @journeys << current_journey
  end

  def current_journey
    @current_journey
  end
end