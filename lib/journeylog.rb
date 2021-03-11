
class JourneyLog
  def initialize(journey_class)
      @journey_class = journey_class
  end

  def start(entry_station)
    @current_journey = @journey_class.new(entry_station)
  end

  def finish(exit_station)
    @current_journey.finish(exit_station)
  end

  private

  def current_journey
    @current_journey ? @current_journey : @current_journey = @journey_class.new(nil)
  end
end
