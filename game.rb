require_relative "./player.rb"

class Game
  def initialize
    new_game
    play
  end

  def new_game
    @board = Board.new
    @current_player = :red
    @board.set_pieces
  end

  def play

  end

  def translate_input

  end

  def switch_turn
    (@current_player == :red) ? (@current_player = :white) : (@current_player = :red)
  end

end