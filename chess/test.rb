require_relative 'game'

def test_knight()
  # g = Game.new
  b = Board.empty_board

  k = Knight.new([3,3], :black, b)
  k.inspect

  p k.moves()
  b.add_piece(k,[3,3])
  # display_me(b)
  g = Game.new(b)
  g.play
end

def display_me( board )
  d=Display.new(board)
  d.render
end


if __FILE__ == $PROGRAM_NAME
  test_knight
end
