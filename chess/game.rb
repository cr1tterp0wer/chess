require './src/board.rb'
# require_relative 'player.rb'
require './src/display.rb'

class Game

  def initialize
    @board   = Board.new
    @display = Display.new(@board)
  end

  def play
    game_over = false
    until game_over
      system("clear")
      @display.render
      @display.cursor.get_input

    end
  end


end




g = Game.new
g.play
