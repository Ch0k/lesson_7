class PassengerWagon < Wagon
  attr_reader :type, :place
  attr_accessor :quantity

  def initialize(quantity)
    @type = 'passenger'
    @quantity = quantity.to_i
    @place = 0
  end

  def place=(value)
    @place += value
  end

  def free_place
    @quantity - @place
  end

end