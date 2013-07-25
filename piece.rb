
class Piece
  attr_accessor :position
  attr_reader :color

  def initialize(board, color)
    @board = board
    @color = color
  end


  #RETURNS ARRAY OF POSITIONS THE PLAYER MAY MOVE TO
  def legal_moves
    if can_kill
      kill_jumps
    else
      slide_positions.select { |pos| @board.on_board?(pos) }
    end
  end

  def can_kill?
    not kill_jumps.empty?
  end

  #RETURNS ARRAY OF ADJACENT ENEMIES
  def kill_jumps
    slides = slide_positions
    jumps = jump_positions
    kill_jumps = []

    slides.each do |s_direction, s_pos|
      next if @board.empty_at?(s_pos)
      jumps.each do |j_direction, j_pos|
        if s_direction == j_direction  &&  @board[*s_pos].color == enemy_color && @board.empty_at?(j_pos)
          kill_jumps << j_pos #@board[*s_pos]
        end
      end
    end

    kill_jumps
  end

  def slide_positions
    i, j = @position
    slides = {
      :f_left => [i + color_dir , j - 1],
      :f_right => [i + color_dir , j + 1]
    }
    slides_copy = slides.dup
    slides_copy.delete_if { |key, value| @board.on_board?(value) == false }

  end

  def jump_positions
    i, j = @position
    jumps = {
      :f_left => [i + 2 * color_dir , j - 2],
      :f_right => [i + 2 * color_dir , j + 2]
    }
    jumps_copy = jumps.dup
    jumps_copy.delete_if { |key, value| @board.on_board?(value) == false }
  end

  def enemy_color
    @color == :red ? :white : :red
  end

  private #___
  # def sum_positions(pos1, pos2) #takes two arrays
#     [pos1[0] + pos2[0], pos1[1] + pos2[1]]
#   end

  def color_dir
    (@color == :red) ? 1 : -1
  end

  def to_s
    (@color == :red) ? "R" : "W"
  end
end # END PIECE




class NullPiece < Piece
  def initialize
    @color = nil
  end

  def to_s
    " "
  end
end




class King < Piece
end













