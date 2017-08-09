require_relative 'piece'

class Bishop < Piece
  include SliddingPiece

  def initialize(pos, color, board)
    @symbol = " \u2657 "
    @symbol.encode("utf-8")
    super(pos, color,board)
  end

  def symbol
    @symbol
  end


  def moves_diff()
   [[1,1], [-1,1], [1,-1], [-1,-1] ]
  end



end
