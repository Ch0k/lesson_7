class CargoWagon < Wagon
  attr_reader :type
  attr_accessor :quantity, :place
  def initialize(quantity)
    @place = 0
    @type = 'cargo'
    @quantity = quantity.to_i
  end

  def free_place
    @quantity - @place
  end
end