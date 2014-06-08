require 'set'
require_relative 'line'
require_relative 'cell'

class Game
  def initialize(*initial_state)
    @cells_per_line = cells_per_line(initial_state)
    @lines = SortedSet.new
  end

  def board
    sort_lines!
    @lines.map(&:to_s).join
  end

  private
  attr_reader :cells, :lines

  def sort_lines!
    @cells_per_line.each do |line_pos, cells|
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
