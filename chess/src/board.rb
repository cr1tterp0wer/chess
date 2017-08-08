require_relative 'piece'
require_relative 'null_piece'
require_relative 'chess_error'
require_relative 'king'
require_relative 'knight'
require_relative 'pawn'
require_relative 'rook'
require_relative 'queen'
require_relative 'bishop'
require 'byebug'

class Board
  attr_accessor :grid

  def initialize(grid = nil)
    @grid = grid
    self.init_grid
  end

  def init_grid

    @grid = Board.empty_grid

    (0..7).each do |i|
      case i
      when 0
        @grid[i] = king_row(i, :black)
      when 1
        @grid[i] = pawn_row(i, :black)
      when 6
        @grid[i] = pawn_row(i, :white)
      when 7
        @grid[i] = king_row(i, :white)
      else
        @grid[i] = null_row
      end
    end
  end

  def pawn_row(row_index, color)
    row = row_index
    res = Array.new(8)
    (0..7).each do |col|
      pos = [row, col]
      res[col] = Pawn.new(pos, color,self)
    end
    res
  end

  def king_row(row, color)
    [Rook.new([row,0],color,self),
     Bishop.new([row,1],color,self),
     Knight.new([row,2],color,self),
     Queen.new([row,3],color,self),
     King.new([row,4],color,self),
     Knight.new([row,5],color,self),
     Bishop.new([row,6],color,self),
     Rook.new([row,7],color,self)
     ]
  end

  def null_row()
    Array.new(8){ NullPiece.new() }
  end

  def self.empty_grid
    @grid = Array.new(8){ Array.new(8) }
  end




  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def move_piece(from_pos, to_pos)
    begin
      raise InvalidMoveError if self[from_pos].symbol.nil?
      raise InvalidMoveError unless to_pos.all? { |el| el.between?(0, 7) } #[1,2]
      raise InvalidMoveError unless from_pos.all? { |el| el.between?(0, 7) } #[1,2]
    rescue InvalidMoveError => e
      puts "Invalid Move"
      return
    end

    piece_to_move = self[from_pos]
    self[to_pos]  = piece_to_move
    piece_to_move.pos = to_pos
    self[from_pos] = NullPiece.new

  end

  # def render
  #
  #   @grid.each do |row|
  #     tmp_row = ""
  #     row.each do |piece|
  #       tmp_row += piece.to_s
  #     end
  #     puts tmp_row
  #   end
  #   nil
  # end
end

if(__FILE__ == $PROGRAM_NAME)
  b = Board.new()
  b.init_grid
  b.render
end
