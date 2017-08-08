require_relative 'piece'

class Bishop < Piece
  def initialize(pos, color, board)
    @symbol = "\u2657"
    @symbol.encode("utf-8")
    super(pos, color,board)
  end

  def symbol
    @symbol
  end
end
