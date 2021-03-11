class Journey
  PENALTY_FARE = 20

  def initialize(entry_station)
    @completed = false
  end

  def finish(exit_station)
    @completed = true
  end

  def completed?
    @completed
  end

  def fare
    @completed ? calculate_fare : PENALTY_FARE
  end

  def calculate_fare


  end

end