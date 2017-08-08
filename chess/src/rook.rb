require_relative 'piece'

class Rook < Piece
  def initialize(pos, color, board)
    @symbol = "\u2656"
    @symbol.encode("utf-8")
    super(pos, color,board)
  end

  def symbol
    @symbol
  end
end
