require_relative "piece"


class NullPiece < Piece
  attr_reader :symbol

  def initialize()
    @symbol = "\u25A0"
    @symbol.encode("utf-8")
  end

  def to_s
    "-"
  end

  def inspect
    @symbol.to_s
  end

  def empty?()
    true
  end

end
