
class Train
  attr_reader :unique_number, :route, :carriages
  attr_accessor :speed, :current_station_index
  protected :speed, :current_station_index

  def initialize(uid)
    @unique_number = uid.to_s
    @carriages = []
    @speed = 0
  end

  def add_speed(amount)
    self.speed += amount
  end

  def stop
    self.speed = 0
  end

  def hitch_carriage(car)
    if speed == 0 && (car.class.ancestors.include? Carriage)
      carriages << car
      car
    end
  end

  def unhook_carriage
    if speed == 0 && carriages.length > 0
      carriages.pop
    end
  end

  def list_carriages
    carriages.map &:to_s
  end

  def assign_route(route)
    if route.class == Route
      @route = route
      self.current_station_index = 0
      current_station.receive_train(self)
    end
  end

  def shift_forward
    if next_station
      current_station.send_train(self)
      self.current_station_index += 1
      current_station.receive_train(self)
    end
  end

  def shift_backward
    if previous_station
      current_station.send_train(self)
      self.current_station_index -= 1
      current_station.receive_train(self)
    end
  end

  def to_s
    unique_number
  end

  def current_station
    route.stations[current_station_index]
  end

  protected

  def next_station
    route.stations[current_station_index + 1]
  end

  def previous_station
    if current_station_index > 0
      route.stations[current_station_index - 1]
    end
  end
end
