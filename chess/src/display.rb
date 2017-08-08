require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end


  def render

    @board.grid.each_index do |row|
      @board.grid[row].each_index do |col|
        if [row, col] == @cursor.cursor_pos
          print @board[[row,col]].symbol.colorize(:red)
        else
          print @board[[row,col]].symbol.colorize(:blue)
        end
      end
      puts "\n"
    end
    nil
  end
end
