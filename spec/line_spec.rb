require_relative '../line'
require_relative '../cell'

describe Line do
  it 'can print itself' do
    cells = build_cells
    line = Line.new cells

    expect(line.to_s).to eq " *   *\n"
  end

  it 'is compared based on the y position of a cell' do
    upper_line = Line.new [Cell.new(x: 2, y: 1)]
    lower_line = Line.new [Cell.new(x: 2, y: 2)]

    expect(upper_line).to be < lower_line
  end
end

def build_cells
  [
    Cell.new(x: 2, y: 2),
    Cell.new(x: 6, y: 2),
  ]
end
