require_relative '../cell'

describe Cell do
  it 'is compared based on x position' do
    cell1 = Cell.new x: 1, y:2
    cell2 = Cell.new x: 2, y:1

    expect(cell1).to be < cell2
  end

  it 'is compared based on y position, for equal x position' do
    cell1 = Cell.new x: 2, y:2
    cell2 = Cell.new x: 2, y:1

    expect(cell2).to be < cell1
  end
end
