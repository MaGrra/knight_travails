require_relative "lib/board.rb"
require_relative "lib/knight.rb"

puts "This works"

game = Knight.new([2,2],[4,5])
game.it_moves
puts "The knight gets there in #{Knight.class_variable_get(:@@final).first} moves"
