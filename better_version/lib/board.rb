class Board
    require_relative "color.rb"

    def initialize(rows = 8, columns = 8)
        new_board(rows, columns)
    end

    def new_board(rows, columns)
        @board = Array.new(rows) { Array.new(columns) }
        @board.each_with_index do |row, i|
            row.each_with_index do |cell, j|
                @board[i][j] = (i+j).even? ? '  '.bg_gray : '  '.bg_black
            end
        end
    end

end

