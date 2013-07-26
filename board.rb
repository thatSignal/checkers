
require_relative "./piece"

class Board
  #place piece, move(origin, destination), legal_move?
  attr_accessor :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) { NullPiece.new } }
  end

  def []=(*pos, piece)
    i, j = pos
    @rows[i][j] = piece
    piece.position = [i, j]

  end

  def [](*pos)
    i, j = pos
    @rows[i][j]
  end



  def empty_at?(pos) # << ARRAY
    i, j = pos
    return true if self[i, j] == nil || self[i, j].is_a?(NullPiece)
    false
  end

  def move!(origin, destination) #takes two arrays
    oi, oj = origin
    di, dj = destination

    moving_piece = self[oi, oj]
    self[di, dj] = moving_piece
    moving_piece.position = [di, dj]
    self[oi, oj] = NullPiece.new
  end

  def team_pieces(color)
    all_pieces.select { |piece| piece.color == color }
  end

  def all_pieces
    @rows.flatten.select { |piece| piece.color == :red || piece.color == :white }
  end

  def on_board?(pos) # << ARRAY
    i, j = pos
    return false if i < 0 || i > 7
    return false if j < 0 || j > 7
    true
  end

  def to_s
    puts "  --------------------------------"
    @rows.each_with_index do |row, i|
      puts "#{i}| #{row.join(" | ")} |\n"
      puts "  --------------------------------"
    end
    puts "   0 - 1 - 2 - 3 - 4 - 5 - 6 - 7 -"
  end

  def set_pieces
    @rows[0].each_index do |i|
      (i.odd?) ? self[0, i] = Piece.new(self, :red) : nil
    end
    @rows[1].each_index do |i|
      (i.even?) ? self[1, i] = Piece.new(self, :red) : nil
    end
    @rows[2].each_index do |i|
      (i.odd?) ? self[2, i] = Piece.new(self, :red) : nil
    end

    @rows[5].each_index do |i|
      (i.even?) ? self[5, i] = Piece.new(self,:white) : nil
    end
    @rows[6].each_index do |i|
      (i.odd?) ? self[6, i] = Piece.new(self, :white) : nil
    end
    @rows[7].each_index do |i|
      (i.even?) ? self[7, i] = Piece.new(self, :white) : nil
    end
  end

  private #________



end # END BOARD
#___________________________________________________________________________

$b = Board.new
#$b.set_pieces
r1 = Piece.new($b, :red)
r2 = Piece.new($b, :red)

w1 = Piece.new($b, :white)
w2 = Piece.new($b, :white)
w3 = Piece.new($b, :white)

$b[2, 1] = r1
$b[3, 2] = w1
$b[3, 0] = w2
#$b[4, 3] = w3
puts $b
puts r1.kill_jumps.inspect
puts r1.can_kill?
#puts $b.all_pieces.inspect

# $b[4,3] = w1
# w1.position = [4,4]
# $b[3,2] = NullPiece.new

$b.move!([3,2], [4,3])





#$b[]
puts $b

