require_relative 'game'

def test_knight()
  # g = Game.new
  b = Board.empty_board

  k = Knight.new([0,0], :blue, b)
  k2 = Knight.new([0,7], :white, b)
  k.inspect

  p k.moves()
  b.add_piece(k,[0,0])
  b.add_piece(k2,[0,7])
  # display_me(b)
  g = Game.new(b)
  g.play
end

def test_valid_moves
  # g = Game.new
  b = Board.empty_board
  queen = Rook.new([0,0], :white,b)

  bish = Bishop.new([3,3], :white, b)
  k = King.new([4,4],:black, b)

  b.add_piece(bish,[0,1])
  b.add_piece(k,[1,1])
  b.add_piece(queen, [0,0])


  moves = k.valid_moves
  print moves
  g = Game.new(b)

  # b.add_piece(bish,[3,3])
  # # display_me(b)
  # g = Game.new(b)
  # g.play
end
# def display_me( board )
#   d=Display.new(board)
#   d.render
# end


if __FILE__ == $PROGRAM_NAME
  test_valid_moves
end
