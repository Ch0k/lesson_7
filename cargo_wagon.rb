class CargoWagon < Wagon
  attr_reader :type
  attr_accessor :size, :space
  def initialize(size)
    @space = 0
    @type = 'cargo'
    @size = size.to_i
  end

  def free_space
    @size - @space
  end
end