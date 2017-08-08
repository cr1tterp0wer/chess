require_relative 'modules/move_module.rb'

class Piece
  attr_accessor :symbol, :board
  attr_reader :pos, :color, :selected


  def initialize(pos=[0,0], color, board)
    @board = board
    @pos = pos
    @color = color
    @selected = false
  end

  def pos=(pos)
    @pos = pos.dup
  end

  def to_s
    @symbol
  end

  def empty?()
    false
  end

  def symbol()
    @symbol
  end

  def valid_moves()
    potential_moves = moves()
  end

  def move_into_check(to_pos)

  end
  def deselect
    @selected = false
  end

  def select
    @selected = true
  end
  #
  # def inspect
  #   "[#{@symbol} #{@pos} #{@color}]"
  # end

end
