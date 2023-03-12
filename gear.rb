# frozen_string_literal: true

require_relative 'wheel'

class Gear
  attr_accessor :chainring, :cog, :wheel

  def initialize(args)
    args = defaults.merge(args)

    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
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

  def defaults
    {
      chainring: 20,
      cog: 20
    }
  end
end

wheel = Wheel.new(2, 10)
gear = Gear.new(
  chainring: 51,
  cog: 11,
  wheel: wheel
)

p gear.gear_inch
