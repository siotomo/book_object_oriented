# frozen_string_literal: true

class Gear
  attr_accessor :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inch
    ratio * (rim + tire * 2)
  end
end

gear = Gear.new(51, 11) # error
gear = Gear.new(51, 11, 2, 10)

p gear.gear_inch
