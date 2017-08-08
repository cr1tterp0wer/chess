require_relative 'piece'

class Bishop < Piece
  def initialize(pos, color)
    @symbol = "\u2657"
    @symbol.encode("utf-8")
    super(pos, color)
  end

  def symbol
    @symbol
  end
end
