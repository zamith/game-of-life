require 'set'
require_relative 'utils'
require_relative 'line'
require_relative 'cell'

class Board
  def initialize(*state)
    @cells_per_line = create_cells(state)
    @lines = SortedSet.new
    @lines_with_cells = []
  end

  def paint
    create_lines!

    Utils.position_search lines_with_cells,
      found: -> { lines.shift.to_s },
      not_found: -> { "\n" }
  end

  def neighbours(cell: nil)
    cells_per_line[cell.y - 1].select { |posible_neighbour| (cell.x - posible_neighbour.x).abs < 2 }
    # cells_per_line[cell.y + 1].select { |posible_neighbour| (cell.x - posible_neighbour.x).abs < 2 }
  end

  private
  attr_reader :cells_per_line, :lines_with_cells

  def lines
    @lines.to_a
  end

  def create_lines!
    cells_per_line.each do |line_pos, cells|
      @lines_with_cells << line_pos
      @lines << Line.new(cells)
    end
  end

  def create_cells(cells)
    cells.inject({}) do |cells_per_line, cell|
      cells_per_line[cell.y] ||= []
      cells_per_line[cell.y] << cell
      cells_per_line
    end
  end
end
