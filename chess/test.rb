require_relative 'game'

def test_knight()
  # g = Game.new
  b = Board.empty_board

  k = Knight.new([0,0], :black, b)
  k2 = Knight.new([0,7], :white, b)
  k.inspect

  p k.moves()
  b.add_piece(k,[0,0])
  b.add_piece(k2,[0,7])
  # display_me(b)
  g = Game.new(b)
  g.play
end

# def display_me( board )
#   d=Display.new(board)
#   d.render
# end


if __FILE__ == $PROGRAM_NAME
  test_knight
end
