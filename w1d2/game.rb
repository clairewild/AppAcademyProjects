require_relative "board.rb"
require_relative "player.rb"
require_relative "computer_player.rb"


class Game
  attr_reader :board, :player

  def initialize(player)
    @board = Board.new
    @prev_guess = nil
    @player = player
  end

  def play
    @board.populate
    board.render
    until board.won?
      take_turn
    end
    puts "Congratulations #{player.name}!!!! You Won!"
  end

  def take_turn
    @prev_guess = get_guess
    board.reveal(@prev_guess)
    board.render
    pos = get_guess
    board.reveal(pos)
    board.render
    check_guess(pos)
    board.render
  end

  def get_guess
    player.prompt
    pos = player.get_input
    player.register_guess(board[pos].value, pos)
    pos
  end

  def check_guess(pos)
    unless board[pos] == board[@prev_guess]
      sleep(3)
      board.hide(pos)
      board.hide(@prev_guess)
    end
    system("clear")
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Enter your name:"
  name = gets.chomp
  player = ComputerPlayer.new(name)
  Game.new(player).play
end
