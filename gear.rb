# frozen_string_literal: true

require_relative 'wheel'

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
end

gear = Gear.new(51, 11, 2, 10)

p gear.gear_inch
