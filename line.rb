require 'set'

class Line
  include Comparable
  attr_accessor :cells

  def initialize(cells)
    @cells = SortedSet.new cells
  end

  def to_s
    line = []
    1.upto(live_cells_position.last) do |index|
      line << if live_cells_position.include?(index)
        "*"
      else
        " "
      end
    end
    "#{line.join}\n"
  end

  def <=>(other)
    self.cells.first.y <=> other.cells.first.y
  end

  private
  def live_cells_position
    @cells.map(&:x)
  end
end
