require_relative "./player.rb"
require_relative './board.rb'

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

    puts @board

    while true
      puts "#{@current_player}, make a move."
      input = Player.make_move
      @board.move!(input[0], input[1])
      switch_turn
      puts @board
    end

  end


  def switch_turn
    (@current_player == :red) ? (@current_player = :white) : (@current_player = :red)
  end

end