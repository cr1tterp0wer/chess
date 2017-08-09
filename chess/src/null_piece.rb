require_relative "piece"
require "singleton"

class NullPiece < Piece

  include Singleton
  attr_reader :symbol

  def initialize()
    @symbol = "   "
    @symbol.encode("utf-8")
    @color = :gold
  end

  def to_s
    "-"
  end

  # def inspect
  #   @symbol.to_s
  # end

  def empty?()
    true
  end

end
