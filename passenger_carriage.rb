
class PassengerCarriage < Carriage
  attr_reader :seats

  def initialize(number, seats)
    super(number)
    @seats = seats.to_i
  end

  def to_s
    number + '::' + seats.to_s + '::'
  end
end
