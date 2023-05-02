# frozen_string_literal: true

#Board deals with UI visualization
class Board
  require_relative 'color'
  require_relative 'knight'
  attr_reader :board

  def initialize(rows = 8, columns = 8)
    new_board(rows, columns)
  end

  def new_board(rows, columns)
    @board = Array.new(rows) { Array.new(columns) }
    @board.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        @board[i][j] = (i + j).even? ? '   '.bg_gray : '   '.bg_black
      end
    end
  end

  def place_piece(piece)
    y, x = piece.position
    @board[x][y] = piece
  end

  def move_piece(start, after)
    place_piece(after)
    y, x = start
    @board[x][y] = (x + y).even? ? '   '.bg_gray : '   '.bg_black
  end

  def background_color(piece)
    x, y = piece.position
    (x + y).even? ? piece.value.black.bg_gray : piece.value.gray.bg_black
  end

  def print_board
    printed = []
    @board.each do |row|
      temp_row = []
      row.each do |cell|
        cell = cell.instance_of?(Knight) ? background_color(cell) : cell
        temp_row << cell
      end
      printed << temp_row
    end
    printed.each { |row| puts row.join }
  end
end
