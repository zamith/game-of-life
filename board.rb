require 'set'
require_relative 'line'
require_relative 'cell'
require_relative 'utils'

class Board
  def initialize(*initial_state)
    @cells_per_line = cells_per_line(initial_state)
    @lines = SortedSet.new
    @lines_with_cells = []
  end

  def paint
    sort_lines!

    Utils.position_search @lines_with_cells,
      found: -> { @lines.to_a.shift.to_s },
      not_found: -> { "\n" }
  end

  private
  attr_reader :cells, :lines

  def sort_lines!
    @cells_per_line.each do |line_pos, cells|
      @lines_with_cells << line_pos
      @lines << Line.new(cells)
    end
  end

  def cells_per_line(coords)
    cells_per_line = {}
    coords.map do |cell_coords|
      cell = Cell.new(x: cell_coords[0], y: cell_coords[1])
      cells_per_line[cell.y] ||= []
      cells_per_line[cell.y] << cell
    end
    cells_per_line
  end
end
