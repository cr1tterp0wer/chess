require_relative 'piece'

class King < Piece
  include SteppingPiece

  def initialize(pos, color, board)
    @symbol = "\u2654"
    @symbol.encode("utf-8")
    super(pos, color,board)
  end

  def symbol
    @symbol
  end

  def move_diffs()
    [[-1,-1],[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1]]
  end

end
