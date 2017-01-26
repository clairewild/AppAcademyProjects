class Game
  attr_accessor :players, :current_player, :previous_player, :fragment, :dictionary

  def initialize(player1 = Player.new("Claire"), player2 = Player.new("Brent"))
    @players = { player1: player1, player2: player2 }
    @current_player = players[:player2]
    @previous_player = players[:player1]
    @fragment = ""
    @dictionary = File.readlines("./dictionary.txt").map(&:chomp)
  end

  def next_player!
    @current_player, @previous_player = previous_player, current_player
  end

  def play
    until won?
      puts display_fragment
      next_player!
      take_turn(current_player)
    end
    puts "YOU WIN!!!"
  end

  def take_turn(player)
    puts "#{current_player.name}, it's your turn!"
    letter = player.guess
    if valid_play?(fragment + letter)
      @fragment << letter
    else
      player.alert_invalid_guess
      take_turn(player)
    end
  end

  def display_fragment
    fragment.length > 0 ? "Word so far: #{fragment}" : "No word yet!"
  end

  def valid_play?(string)
    dictionary.any? do |word|
      word[0...string.length] == string
    end
  end

  def won?
    dictionary.include?(fragment)
  end

end


class Player
  attr_accessor :name

  def ininitalize(name)
    @name = name
  end

  def guess
    puts "What is your guess? (only a letter, please)"
    gets.chomp
  end

  def alert_invalid_guess
    puts "Sorry, your letter could not make a valid word."
  end
end
