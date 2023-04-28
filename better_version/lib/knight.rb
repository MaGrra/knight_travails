class Knight
    
    def initialize(position)
        @value = ' ♞ '
        @position = position
        @moves = [Node.new(postion)]
        @visited = []
    end

    def knight_moves(end_position)
        path = []
        return if end_position == @position
    end

end