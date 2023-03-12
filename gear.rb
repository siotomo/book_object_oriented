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

  # selfに対してのみメッセージを送ることで依存を減らす
  def gear_inch
    ratio * diameter
  end

  # Wheelのdiamterメソッドへの依存がここで止まる
  def diameter
    wheel.diameter
  end
end

wheel = Wheel.new(2, 10)
gear = Gear.new(51, 11, wheel)

p gear.gear_inch
