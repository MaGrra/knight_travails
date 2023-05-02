# frozen_string_literal: true

require_relative 'lib/knight'

puts 'This works'
from = [1, 1]
to = [8, 8]
game = Knight.new(from, to)
game.it_moves
puts "The knight gets from #{from} to #{to} in #{Knight.class_variable_get(:@@final).min} moves"
