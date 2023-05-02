# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/knight'

puts 'Welcome to a hopefully better attemt of this'

test = Board.new
dude = Knight.new([1, 1])
path = test.place_piece(dude)
test.print_board
test.move_piece(test.board[1][1].position, test.board[1][1].knight_moves([7, 7]))
test.print_board
