
class FreightWagon < Carriage
  attr_reader :purpose

  def initialize(number, purpose)
    super(number)
    @purpose = purpose.to_s
  end

  def to_s
    "#{number}=#{purpose}="
  end
end
