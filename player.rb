class Player
  def initialize(game)
    @game = game
  end

  def self.make_move
    #puts @game.board
    #puts "#{@game.current_player}, please make your move"
    input = get_move
    final_input = [translate_input(input[0]), translate_input(input[1])]
  end

  #CLEANS it up
  def self.get_move
    input = gets.chomp.split(",").map(&:strip)
  end

  def self.translate_input(input)
    letter = input[0]
    num = input[1]

    puts letter
    puts num

    col = "abcdefg".index(letter)
    row = [8, 7, 6, 5, 4, 3, 2, 1].index(num.to_i)

    return [row, col]
  end

end