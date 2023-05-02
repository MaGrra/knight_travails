# frozen_string_literal: true

#The movement of the Knight
class Knight
  require_relative 'node'
  attr_reader  :value
  attr_accessor :visual_path, :position

  MOVES = [
    [1, 2], [-1, 2], [1, -2], [-1, -2],
    [2, 1], [2, -1], [-2, 1], [-2, -1]
  ].freeze

  def initialize(position)
    @value = ' ♞ '
    @position = position
    @moves = [Node.new(position)]
    @visited = []
    @visual_path = []
  end

  def knight_moves(end_position)
    path = []
    return if end_position == @position

    valid?(next_in_queue)
    path << find_path(end_position)
    self
  end

  def path_to_root(node)
    path = []
    path.unshift(node.value)
    until node.parent.nil?
      path.unshift(node.parent.value)
      node = node.parent
    end
    @visual_path = path
    p path
  end

  def find_path(end_position)
    @moves.each do |node|
      next unless node.value == end_position

      @position = node.value
      return path_to_root(node)
    end
    valid?(next_in_queue)
    find_path(end_position)
  end

  def next_in_queue
    return if @moves.empty?

    current_node = @moves.pop
    return next_in_queue if @visited.include?(current_node.value)

    current_node
  end

  def go(where)
    @position = where
    p @position
  end


  def valid?(node)
    location = node.value
    @visited << location
    MOVES.each do |move|
      x = move[0] + location[0]
      y = move[1] + location[1]
      @moves.unshift(Node.new([x, y], parent: node)) if x.between?(0, 8) && y.between?(0, 8)
    end
  end
end
