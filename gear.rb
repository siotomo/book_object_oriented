# frozen_string_literal: true

require_relative 'wheel'

class Gear
  attr_accessor :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  # wheelは「diameter」に応答できるダック という依存のみに減少
  def gear_inch
    ratio * wheel.diameter
  end
end

wheel = Wheel.new(2, 10)
gear = Gear.new(51, 11, wheel)

p gear.gear_inch
