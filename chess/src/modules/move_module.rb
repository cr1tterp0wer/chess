require 'byebug'

module SteppingPiece

  def moves
    results_moves =[]
    moves = self.move_diffs()
    moves.each do |move|
      next_move = [move[0] + @pos[0], move[1] + @pos[1]]
      results_moves << next_move if next_move[0].between?(0,7) && next_move[1].between?(0,7)
    end
    results_moves
  end

  private
  def moves_diff()

  end
end

module SliddingPiece

  def moves

    move_diffs = self.moves_diff
    results_moves = []

    move_diffs.each do |diff|
      dy,dx = diff
      i=1
      y,x = self.pos
      while (dx*i + x).between?(0,7) && (dy*i + y).between?(0,7)
        next_pos = [i*dy+y, i*dx+x]
        results_moves << next_pos
        i+=1
        break unless self.board[next_pos] == NullPiece.instance
      end
    end
    results_moves
  end

  private
  def moves_diff()



  end


end
