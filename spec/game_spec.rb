require_relative '../game'

describe Game do
  it 'shows one living cell' do
    game = Game.new [10,1]

    expect(game.board).to eq "         *\n"
  end

  it 'shows two living cells' do
    game = Game.new [10,1], [2,2]

    expect(game.board).to eq <<BOARD
         *
 *
BOARD
  end
end
