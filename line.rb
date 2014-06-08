require 'set'

class Line
  include Comparable
  attr_accessor :cells

  def initialize(cells)
    @cells = SortedSet.new cells
  end

  def to_s
    line = Utils.position_search live_cells_position,
      found: -> { "*" },
      not_found: -> { " " }

    "#{line}\n"
  end

  def <=>(other)
    self.cells.first.y <=> other.cells.first.y
  end

  private
  def live_cells_position
    @cells.map(&:x)
  end
end
