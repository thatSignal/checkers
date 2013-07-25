#first commit
require_relative "./piece"

class Board
  #place piece, move(origin, destination), legal_move?
  attr_accessor :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) { " " } }
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

  def empty_at?(pos)
    i, j = pos
    return true if @rows[i][j] == nil
    false
  end

  def move(origin, destination) #takes two arrays
    oi, oj = origin
    di, dj = destination

    piece = self[oi, oj]

  end

  def to_s
    puts "--------------------------------"
    @rows.each do |row|
      puts "| #{row.join(" | ")} |\n"
      puts "--------------------------------"
    end
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
$b.set_pieces

puts $b[0, 1].class
piece = $b[0, 1]
puts piece.slide_positions
puts $b

puts $b[0, 1]

