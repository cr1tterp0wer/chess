require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render_moves(moves)
    @board.grid.each_index do |row|
      @board.grid[row].each_index do |col|
        piece = @board[[row,col]]
        color = piece.color
        if moves.include?([row,col]) 
          print piece.symbol.colorize(:color=>color,:background => :green).blink
        end
      end
      puts "\n"
    end
    nil
  end

  def render
    @board.grid.each_index do |row|
      @board.grid[row].each_index do |col|
        piece = @board[[row,col]]
        tile = (row+col).even? ? :gray : :red
        color = piece.color
        if [row, col] == @cursor.cursor_pos
          print piece.symbol.colorize(:color => color,:background => :blue)
        else
          if piece.selected
            print piece.symbol.colorize(:color=>color,:background => :green)
          else
            print piece.symbol.colorize(:color=>color,:background => tile)
          end
        end
      end
      puts "\n"
    end
    nil
  end
end
