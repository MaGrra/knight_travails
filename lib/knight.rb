class Knight
    attr_accessor :children, :move_start, :gen, :final
    attr_reader :moves

    MOVES = [
        [1,2],[-1,2],[1,-2],[-1,-2],
        [2,1],[2,-1],[-2,1],[-2,-1]].freeze

    @@final = []

    def initialize(move_start, move_end , gen = 0, children = [])
        @move_start = move_start
        @move_end = move_end.freeze
        @children = children
        @gen = gen
    end

    def it_moves(location = @move_start, move_end = @move_end, gen = @gen)
        
        return  @@final.push(gen.to_s) if location == @move_end
        return if gen > 5

        node = Knight.new(location, move_end, gen)

        MOVES.each do |move|
            node.children <<  ([(move[0]+location[0]), (move[1] + location[1])])
        end
        node.children.each do |child|
            it_moves(child, move_end, gen + 1)
        end
    end
        
end