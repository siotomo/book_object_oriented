# frozen_string_literal: true

class Gear
  attr_accessor :chainring, :cog

  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    chainring / cog.to_f
  end
end

gear = Gear.new(51, 11)

p gear.ratio
