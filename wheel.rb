class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + tire * 2
  end

  def circumstance
    diameter * Math::PI
  end
end

p Wheel.new(1,2).circumstance
