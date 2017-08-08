module SteppingPiece

  def moves
    moves = self.move_diffs()
    moves.map! do |move|
      [move[0] + @pos[0], move[1] + @pos[1]]
    end
    moves
  end

  private
  def moves_diff()

  end
end
