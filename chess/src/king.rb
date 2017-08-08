require_relative 'piece'
require '/Users/appacademy/Desktop/W2D1/chess/modules/steppingpiece.rb'

class King < Piece
  include SteppingPiece

  def initialize(pos, color)
    @symbol = "\u2654"
    @symbol.encode("utf-8")
    super(pos, color)
  end

  def symbol
    @symbol
  end

  def move_diffs()
    [[-1,-1],[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1]]
  end

end
