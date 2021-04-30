
class Station
  NAME_FORMAT = /.+/
  include InstanceCounter
  attr_reader :name, :trains
  @@all = []
  # Имеет название, которое указывается при ее создании
  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@all << self
    register_instance
  end

  def valid?
    validate!
    true
  rescue
    false
  end
  
  # написать метод, который принимает блок и проходит по всем поездам на станции,
  # передавая каждый поезд в блок.

  def each_train
    @trains.each{|train| yield(train) }
  end
  
  # Может принимать поезда (по одному за раз)
  def reception(train)
    @trains << train
  end
  
  # Может возвращать список всех поездов на станции, находящиеся в текущий 
  # момент
  
  # Может возвращать список поездов на станции по типу (см. ниже): 
  # кол-во грузовых, пассажирских
  def train_list_type(type)
    @trains.filter{|train| train.type == type}
  end
  
  # Может отправлять поезда (по одному за раз, при этом, 
  # поезд удаляется из списка поездов, находящихся на станции).  
  def send_train(train)
    @trains.delete(train)
  end
  
  def self.all
    #@@all.each_with_index{|station, index| yield(station, index)}
    @@all.each_with_index{|station, index| puts "#{index}: Станция #{station.name}"}
  end

  private 

  def validate!
    raise "Name can't be nil" if name.nil?
    raise "Name has invalid format" if name !~ NAME_FORMAT
  end
  
end
