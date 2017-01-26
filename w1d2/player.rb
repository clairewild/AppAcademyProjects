class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def prompt
    print "Enter position (row, col): "
  end

  def get_input
    gets.chomp.split(",").map(&:to_i)
  end

  def register_guess
  end

end
