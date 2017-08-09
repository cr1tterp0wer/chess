require_relative 'piece'

class Pawn < Piece

  def initialize(pos, color,board)

    @symbol = " \u2659 "
    @symbol.encode("utf-8")
    super(pos, color,board)
  end

  def symbol
    @symbol
  end
  def moves
  end
  def at_start_row?

  end

  def forward_dir

  end
  def forward_steps

  end
  def side_attacks

  end
end
