class Oystercard
  attr_reader :balance, :in_journey
  DEFAULT_BALANCE = 0
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  # JOURNEY_STATE = "Inactive"

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    if @balance + amount > MAXIMUM_BALANCE
      raise "Top up invalid, balance maximum is £90, your current balance is #{@balance}"
    end
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    if @balance < MINIMUM_BALANCE
      raise 'Insufficient funds'
    end
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    if @in_journey == true
      'in journey'
    else @in_journey == false
      'not in journey'
    end
  end

end
