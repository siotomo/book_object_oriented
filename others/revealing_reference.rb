# frozen_string_literal: true

# Wheelを2次元配列の情報から作成

class RevealingReference
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  # diametersはmapに応えられることと、diameterとそれが引数wheelを取ることに依存
  def diameters
    @wheels.map { |wheel| diameter(wheel) }
  end

  # wheelがどのようにdiameterを算出するかに依存
  def diameter(wheel)
    wheel.rim + wheel.tire * 2
  end

  Wheel = Struct.new(:rim, :tire)

  # このメソッドが、diametersは引数の配列データの順番の知識を引き受ける
  def wheelify(data)
    @wheels ||= data.map do |cell|
      Wheel.new(cell[0], cell[1])
    end
  end
end

data = [[1, 2], [3, 4]]
revealing_reference = RevealingReference.new(data)
p revealing_reference.diameters
