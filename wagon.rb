
class PassengerCarriage
  attr_reader :number, :seats

  def initialize(number, seats)
    @number = number.to_s
    @seats = seats.to_i
  end

  def to_s
    number + '::' + seats.to_s + '::'
  end
end

class FreightWagon
  attr_reader :number, :purpose

  def initialize(number, purpose)
    @number = number.to_s
    @purpose = purpose.to_s
  end

  def to_s
    number + '=' + purpose + '='
  end
end
