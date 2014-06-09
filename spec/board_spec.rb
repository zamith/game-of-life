require_relative '../board'

describe Board do
  it 'shows one living cell' do
    board = Board.new first_line_cell(10)

    expect(board.paint).to eq "         *\n"
  end

  it 'shows two living cells' do
    board = Board.new first_line_cell(10), second_line_cell(2)

    expect(board.paint).to eq <<BOARD
         *
 *
BOARD
  end

  it 'shows empty lines' do
    board = Board.new first_line_cell(10), third_line_cell(2)

    expect(board.paint).to eq <<BOARD
         *

 *
BOARD
  end

  it 'can tell who are the neighbours of a cell' do
    neighbours = big_board.neighbours(cell: Cell.new(x: 2, y:2))

    expect(neighbours).to eq [
      Cell.new(x: 1, y: 1),
      Cell.new(x: 2, y: 1),
      Cell.new(x: 3, y: 1)
    ]
  end
end

def first_line_cell(x)
  Cell.new x: x, y: 1
end

def second_line_cell(x)
  Cell.new x: x, y: 2
end

def third_line_cell(x)
  Cell.new x: x, y: 3
end

def big_board
  Board.new Cell.new(x: 1, y: 1),
    Cell.new(x: 2, y: 1),
    Cell.new(x: 3, y: 1),
    Cell.new(x: 4, y: 1),
    # Cell.new(x: 1, y: 2),
    Cell.new(x: 2, y: 2)
    # Cell.new(x: 3, y: 2),
    # Cell.new(x: 1, y: 3),
    # Cell.new(x: 2, y: 3),
    # Cell.new(x: 3, y: 3)
end
