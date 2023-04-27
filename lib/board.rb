class Board

    def initialize
        @board = make_board
    end

    def make_board(n = 8)
     board = Array.new(64,[[],[]])
        for a in 1..n do
             board[a] = a
            
        end
        board
        
    end

end

