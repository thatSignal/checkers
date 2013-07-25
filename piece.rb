
class Piece
  attr_accessor :position
  attr_reader :color

  def initialize(board, color)
    @board = board
    @color = color
  end

  MOVE_DELTAS = [
    [-1, 1],
    [1, 1]
  ]

  JUMP_DELTAS = [
    [-2, 2],
    [2, 2]
  ]

  def can_jump?
    diagonals = slide_positions

    diagonals.each do |pos|
      if @board[*pos] != nil || @board[*pos].color != @color
        return true
      else
        return false
      end
    end

  end

  def slide_positions
    i, j = @position
    slides = [[i + color_dir , j - 1], [i + color_dir , j + 1]]
    slides
  end

  def enemy_color
    @color == :red ? :white : :red
  end




  private #____________
  def sum_positions(pos1, pos2) #takes two arrays
    [pos1[0] + pos2[0], pos1[1] + pos2[1]]
  end

  def color_dir
    (@color == :red) ? 1 : -1
  end

  def to_s
    (@color == :red) ? "R" : "W"
  end

end # END PIECE
