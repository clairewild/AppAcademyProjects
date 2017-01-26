
require 'byebug'

class ComputerPlayer
  attr_reader :guessed

  def initialize(name)
    @name = name
    @guessed = Hash.new { |h, k| h[k] = [] }
    @guess_num = 0
    @matched_pairs = []
  end

  def prompt
  end

  def get_input
    pos = get_guess
    toggle_guess_num
    pos
  end

  def get_guess
    @guessed.values.each do |array|
      return array[@guess_num] if array.length == 2
    end
    random_guess
  end

  def toggle_guess_num
    @guess_num == 0 ? @guess_num = 1 : @guess_num = 0
  end

  def register_guess(key, pos)
    @guessed[key] << pos
    @guessed[key] = @guessed[key].uniq
  end

  def random_guess
    row = rand(4)
    col = rand(4)
    @guessed.values.each do |v|
      if v.include?([row, col]) || @matched_pairs.include?([row, col])
        return random_guess
      end
    end
    [row, col]
  end

end

comp = ComputerPlayer.new("Claire")
