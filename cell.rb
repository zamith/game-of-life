class Cell
  include Comparable
  attr_reader :x, :y

  def initialize(x: 0, y: 0)
    @x = x
    @y = y
  end

  def <=>(other)
    if self.x == other.x
      self.y <=> other.y
    else
      self.x <=> other.x
    end
  end
end
