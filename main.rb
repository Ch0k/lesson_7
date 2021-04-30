require_relative 'instance_counter.rb'
require_relative 'company.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_train.rb'
require_relative 'wagon.rb'
require_relative 'cargo_wagon.rb'
require_relative 'passenger_wagon.rb'
require_relative 'station.rb'
require_relative 'route.rb'

class RailRoad

  def menu
    puts 'Введите 1 если вы хотите создать станцию, поезд, маршрут, вагон'
    puts 'Введите 2 если вы хотите произвести операции с объектами'
    puts 'Введите 3 если вы хотите ввести данные о объектах'
    puts 'Ввести 0 или стоп чтобы закончить программу'
    x = gets.chomp.to_i
    case x
    when 1
      puts 'Введите 1 создать станцию'
      puts 'Введите 2 создать поезд'
      puts 'Введите 3 создать маршрут'
      puts 'Ввести 4 создать вагон'
      y = gets.chomp.to_i
      case y
      when 1
        create_station
      when 2
        create_train
      when 3
        create_route
      when 4
        create_wagon
      end

    when 2
      puts 'Выберите 1 Назначать маршрут поезду'
      puts 'Выберите 2 Добавить вагон поезду'
      puts 'Выберите 3 Отцепить вагон поезду'
      puts 'Выберите 4 Переместить поезд вверх'
      puts 'Выберите 5 Переместить поезд вниз'
      y = gets.chomp.to_i
      case y
      when 1
        add_route_to_train
      when 2
        add_wagon
      when 3
        delete_wagon
      when 4
        move_station_up
      when 5
        move_station_down
      end
    when 3
      puts 'Выберите 1 Посмотреть список станций'
      puts 'Выберите 2 Посмотреть поезда на станции'
      puts 'Выберите 3 Посмотреть вагоны поезда'
      puts 'Выберите 4 Посмотреть список поездов на станции'
      y = gets.chomp.to_i
      case y
      when 1
        show_stations
      when 2
        show_trains
      when 3
        list_wagons
      when 4
        list_trains
      end
    end
  end

  def seed

    cargotrain1 = CargoTrain.new('22222')
    passengertrain1 = PassengerTrain.new('222-22')
    cargowagon1 = CargoWagon.new('50')
    cargowagon2 = CargoWagon.new('50')
    cargowagon3 = CargoWagon.new('50')
    cargowagon4 = CargoWagon.new('50')
    passengerwagon1 = PassengerWagon.new('55')
    passengerwagon2 = PassengerWagon.new('55')
    passengerwagon3 = PassengerWagon.new('55')
    passengerwagon4 = PassengerWagon.new('55')
    station1 = Station.new('Devyatkino')
    station2 = Station.new('Grazdanskaya')
    station3 = Station.new('Akademicheskaya')
    station4 = Station.new('Politechnicheskaya')
    station5 = Station.new('Muzhestva')
    station6 = Station.new('Lesnaya')
    station7 = Station.new('Viborgskaya')
    station8 = Station.new('Pl. Lenina')
    route1 = Route.new(station1,station4)
    route2 = Route.new(station5,station8)
    route1.add_station(station2)
    route1.add_station(station3)
    route2.add_station(station6)
    route2.add_station(station7)
    cargotrain1.route(route1)
    passengertrain1.route(route2)
    cargotrain1.add_wagon(cargowagon1)
    cargotrain1.add_wagon(cargowagon2)
    cargotrain1.add_wagon(cargowagon3)
    cargotrain1.add_wagon(cargowagon4)
    passengertrain1.add_wagon(passengerwagon1)
    passengertrain1.add_wagon(passengerwagon2)
    passengertrain1.add_wagon(passengerwagon3)
    passengertrain1.add_wagon(passengerwagon4)


  end

  private

  def move_station_down
    Train.all
    puts 'Выберите поезд из списка'
    z = gets.chomp.to_i
    Train.all[z-1].move_station_down
  end
  
  def move_station_up
    Train.all
    puts 'Выберите поезд из списка'
    z = gets.chomp.to_i
    Train.all[z-1].move_station_up
  end

  def show_trains
    Station.all
    puts 'Введите порядковый номер по списку первой станции'
    z = gets.chomp.to_i
    Station.all[z-1].trains
  end

  def train_all
    Train.all
  end
  
  def show_stations
    Station.all
  end
  
  def create_station
    puts 'Введите название станции'
    z = gets.chomp
    station = Station.new(z)
    puts "Создана станция #{z}"
  rescue
    puts 'Название станции не может быть пустым'
    create_station
  end

  def create_train
    puts 'Введите номер поезда в формате ***-** или *****. Примечание * - цифра или буква'
    z = gets.chomp
    train = Train.new(z)
    puts "Создан поезд номер #{z}"
  rescue RuntimeError => e
    puts 'Неверный формат '
    create_train 
  end

  def create_route
    Station.all
    puts 'Введите порядковый номер по списку первой станции'
    z = gets.chomp.to_i
    puts 'Введите пордковый номер по списку конечной станции станции'
    f = gets.chomp.to_i
    route = Route.new(Station.all[z-1],Station.all[f-1])
  rescue
    puts 'Введен неверный порядковый номер станции  '
    create_route 
  end

  def create_wagon
    puts 'Введите кол-во мест в вагоне'
    z = gets.chomp.to_i
    wagon = Wagon.new(z)
    puts "Создан вагон с количеством мест #{z}"
  end

  def list_wagons
    Train.all
    puts 'Выберите поезд из списка'
    z = gets.chomp.to_i
    Train.all[z-1].block {|y| puts "Тип вагона: #{y.type}, количество свободных мест #{y.free_place}, количество занятых мест #{y.place} "}
  end

  def list_trains
    Station.all
    puts 'Выберите станцию из списка'
    z = gets.chomp.to_i
    Station.all[z-1].block {|y| puts "Номер поезда: #{y.number} , Тип поезда: #{y.type}, Количество вагонов: #{y.wagon_quantity}"}
  end
  
  def add_route_to_train
    Train.all
    puts 'Введите порядковый номер по списку поезда'
    f = gets.chomp.to_i
    Route.all
    puts 'Введите порядковый номер маршрута'
    z = gets.chomp.to_i
    Train.all[f-1].route(Route.all[z-1])
  rescue
    puts 'Введен неверный порядковый номер поезда или номер маршрута'
    add_route_to_train
  end
end