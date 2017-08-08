require './src/board.rb'
# require_relative 'player.rb'
require './src/display.rb'
require 'byebug'
class Game

  def initialize(board=nil)
  
    @board = board unless board.nil?
    @board ||= Board.starting_board
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

if __FILE__ == $PROGRAM_NAME
  g = Game.new
  g.play
end
