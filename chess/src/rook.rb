require_relative 'piece'

class Rook < Piece
  include SliddingPiece
  def initialize(pos, color, board)
    @symbol = " \u2656 "
    @symbol.encode("utf-8")
    super(pos, color,board)
  end

  def symbol
    @symbol
  end

  def moves_diff
   [
    [1,0],
    [-1,0],
    [0,1],
    [0,-1]
   ]
  end


end
