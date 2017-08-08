class Piece
  attr_accessor :pos, :symbol, :board
  attr_reader :color

  def initialize(pos=[0,0], color, board)
    @board = baord
    @pos = pos
    @color = color
  end

  def to_s
    @symbol
  end

  def empty?()
    false
  end

  def symbol()
    @symbol
  end

  def valid_moves()
    potential_moves = moves()
  end

  def move_into_check(to_pos)

  end
  #
  # def inspect
  #   "[#{@symbol} #{@pos} #{@color}]"
  # end

end
