class Oystercard
  attr_reader :balance, :in_journey, :entry_station, :exit_station, :stations
  DEFAULT_BALANCE = 0
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  # JOURNEY_STATE = "Inactive"

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
    @exit_station = nil
    @stations = {}
  end

  def top_up(amount)
    if @balance + amount > MAXIMUM_BALANCE
      raise "Top up invalid, balance maximum is £90, your current balance is #{@balance}"
    end
    @balance += amount
  end

  def touch_in(station)
    if @balance < MINIMUM_BALANCE
      raise 'Insufficient funds'
    end
    @entry_station = station
    @stations[:entry_station] = @entry_station
    @in_journey = true

  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    @stations[:exit_station] = exit_station
    @in_journey = false
  end

  def in_journey?
    @entry_station != nil
  end

  def history
    @stations
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end

# > card.touch_in('London Victoria')
# > card.touch_out('Brixton')
# > card.history
# => {London Victoria' => 'Brixton'] }
# stations = Hash.new
# stations[entry_station] = exit_station
# stations = {"Victoria" => nil}
# > card.touch_out('Brixton')
#stations[entry_station] = exit_station
