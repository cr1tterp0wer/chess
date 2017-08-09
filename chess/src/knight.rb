require_relative 'piece'

class Knight < Piece
  include SteppingPiece

  def initialize(pos, color, board)
    @symbol = " \u2658 "
    @symbol.encode("utf-8")
    super(pos, color,board)
  end

  def symbol
    @symbol
  end

  def move_diffs()
    [ [1,-2],
      [2,-1],
      [2,1],
      [1,2],
      [-1,2],
      [-2,1],
      [-2,-1],
      [-1,-2] ]
  end

end
