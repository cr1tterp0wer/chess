require_relative 'piece'

class Queen < Piece
  def initialize(pos, color)
    @symbol = "\u2655"
    @symbol.encode("utf-8")
    super(pos, color)
  end

  def symbol
    @symbol
  end
end
