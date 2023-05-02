# frozen_string_literal: true

class Knight
  attr_accessor :children, :move_start, :gen, :final, :path
  attr_reader :moves

  MOVES = [
    [1, 2], [-1, 2], [1, -2], [-1, -2],
    [2, 1], [2, -1], [-2, 1], [-2, -1]
  ].freeze

  @@final = []
  @@history = []

  def initialize(move_start, move_end, gen = 0, children = [])
    @move_start = move_start
    @move_end = move_end.freeze
    @children = children
    @gen = gen
    @path = @path.push(move_start)
  end

  def it_moves(location = @move_start, move_end = @move_end, gen = @gen)
    return @@final.push(gen.to_s) if location == @move_end
    return if gen > 5

    node = Knight.new(location, move_end, gen)

    MOVES.each do |move|
      if move[0] + location[0] < 9 &&
        (move[0] + location[0]).positive? && move[1] + location[1] < 9 &&
        (move[1] + location[1]).positive?
        node.children << ([(move[0] + location[0]), (move[1] + location[1])])
      else
        node.children << nil
      end
    end
    node.children.each do |child|
      it_moves(child, move_end, gen + 1) unless child.nil?
    end
  end
end
