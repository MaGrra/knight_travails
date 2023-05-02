# frozen_string_literal: true

#Lowest level structure for Knight
class Node
  attr_accessor :value, :parent

  def initialize(value, parent: nil)
    @value = value
    @parent = parent
  end
end
