# frozen_string_literal: true

class Gear
  attr_accessor :chainring, :cog, :wheel

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inch
    ratio * wheel.diameter
  end

  # OpenStructでWheelクラスを定義して、設計判断下すまでの留保
  Wheel = Struct.new(:rim, :tire) do
    def diameter
      rim + (tire * 2)
    end
  end
end

gear = Gear.new(51, 11, 2, 10)

p gear.gear_inch
