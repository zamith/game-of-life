require_relative '../board'

describe Board do
  it 'shows one living cell' do
    board = Board.new [10,1]

    expect(board.paint).to eq "         *\n"
  end

  it 'shows two living cells' do
    board = Board.new [10,1], [2,2]

    expect(board.paint).to eq <<BOARD
         *
 *
BOARD
  end

  it 'shows empty lines' do
    board = Board.new [10,1], [2,3]

    expect(board.paint).to eq <<BOARD
         *

 *
BOARD
  end
end
