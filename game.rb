require_relative 'board'

board = Board.new Cell.new(x: 10, y: 1), Cell.new(x: 2, y: 2)
print board.paint
