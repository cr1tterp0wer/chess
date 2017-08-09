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
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def add_piece(piece, pos)
    piece.pos = pos
    self[pos] = piece
    # piece.pos = pos #unless piece == NullPiece.instance
  end

  def get_piece_at(pos)
    self[pos]
  end

  def remove_piece(from_pos)
    self[from_pos] = NullPiece.instance
  end

  # def move_piece(from_pos, to_pos)
  def move_piece(piece, to_pos)
    begin
      raise InvalidMoveError if piece == NullPiece.instance
    rescue InvalidMoveError => e
      puts "Invalid Move"
      return
    end

    from_pos = piece.pos
    remove_piece(from_pos)
    add_piece(piece, to_pos)
  end

  def place_king_row(row, color)
    pieces = Board.king_row(row, color)
    pieces.each_with_index do |piece, col|
      self.add_piece(piece, [row, col])
    end
  end

  def place_pawn_row(row,color)
    pieces = Board.pawn_row(row,color)
    pieces.each_with_index do |piece, col|
      self.add_piece(piece,[row,col])
    end
  end
  def place_null_row(row,_)
    (0..7).each do |col|
      self.add_piece(NullPiece.instance,[row,col])
    end
  end

  def add_null_rows
   @grid.each_index do |row|
     place_null_row(row,nil)
   end
  end

  def notify(pos)
    #lock
    any_selected = is_any_selected?

    if any_selected

      selected_piece = get_selected_piece
      from_pos = selected_piece.pos.dup

      # byebug
      selected_piece.pos = pos.dup
      selected_piece.deselect
      self[pos] = selected_piece

      self[from_pos] = NullPiece.instance
      self[pos].deselect
      # move_piece(selected_piece,pos)
      # add_piece(selected_piece, pos)
      # remove_piece(from_pos)
      deselect_all
      #ifNull handle
    else
      #ifNull Handle
      select_piece_at_pos(pos)
    end
  end

  def select_piece_at_pos(pos)
    self[pos].select
  end

  def get_selected_piece
    @grid.each do |row|
      row.each do |piece|
        return piece if piece.selected
      end
    end
  end

  def is_any_selected?
    @grid.each do |row|
      row.each do |piece|
        return true if piece.selected
      end
    end
    return false
  end

  def deselect_all
    @grid.each do |row|
      row.each do |piece|
        piece.deselect
      end
    end
  end



  private

 #PRIV INSTANCE METHS

  #CLASS METHS
  def self.empty_grid
    Array.new(8){ Array.new(8) }
  end

  def self.empty_board
    grid = Board.empty_grid
    b = Board.new(grid)
    b.add_null_rows()
    b
  end


  def self.starting_board
    grid = Board.empty_grid
    board = Board.new(grid)

    (0..7).each do |i|
      case i
      when 0
        # grid[i] = self.king_row(i, :black)
        board.place_king_row(i, :blue)
      when 1
        #grid[i] = self.pawn_row(i, :black)
        board.place_pawn_row(i,:blue)
      when 6
        #grid[i] = self.pawn_row(i, :white)
        board.place_pawn_row(i,:white)
      when 7
        #grid[i] = self.king_row(i, :white)
        board.place_king_row(i,:white)
      else
        #grid[i] = self.null_row
        board.place_null_row(i,nil)
      end
    end
    board
  end

  def self.pawn_row(row_index, color)
    row = row_index
    res = Array.new(8)
    (0..7).each do |col|
      pos = [row, col]
      res[col] = Pawn.new(pos, color,self)
    end
    res
  end

  def self.king_row(row, color)
    [Rook.new([row,0], color, self),
     Bishop.new([row,1], color, self),
     Knight.new([row,2], color, self),
     Queen.new([row,3], color, self),
     King.new([row,4], color, self),
     Knight.new([row,5], color, self),
     Bishop.new([row,6], color, self),
     Rook.new([row,7], color, self)
     ]
  end

  def self.null_row()
    Array.new(8){ NullPiece.instance() }
  end
end

if(__FILE__ == $PROGRAM_NAME)
  b = Board.new()
  b.starting_board
  b.render
end
