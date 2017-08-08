require_relative 'piece'

class Queen < Piece
  def initialize(pos, color,board)
    @symbol = "\u2655"
    @symbol.encode("utf-8")
    super(pos, color,board)
  end

  def symbol
    @symbol
  end
end
