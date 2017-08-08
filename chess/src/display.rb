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
        piece = @board[[row,col]]
        p piece if [row,col] == [0,0]
        if [row, col] == @cursor.cursor_pos
          print piece.symbol.colorize(:red)
        else
          if piece.selected
            # byebug
            print piece.symbol.colorize(:green)
          else
            print piece.symbol.colorize(:blue)
          end
        end
      end
      puts "\n"
    end
    nil
  end
end
