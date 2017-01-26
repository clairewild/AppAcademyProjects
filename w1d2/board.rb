require_relative "card.rb"

class Board

  def initialize
    @grid = Array.new(4) { Array.new(4) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, card)
    row, col = pos
    @grid[row][col] = card
  end

  def populate
    values = card_values
    @grid.each_with_index do |row, i|
      row.each_index do |j|
        pos = [i, j]
        self[pos] = Card.new(values.pop)
      end
    end
  end

  def card_values
    values = []
    i = 0
    until values.length >= grid_squares
      2.times { values << i }
      i += 1
    end
    values.shuffle
  end

  def grid_squares
    @grid.length * @grid[0].length
  end

  def render
    @grid.each do |row|
      row_string = ""
      row.each do |card|
        row_string << card.to_s
      end
      puts row_string
    end
  end

  def won?
    @grid.each do |row|
      return false unless row.all?(&:face_up)
    end
  end

  def reveal(pos)
    self[pos].reveal unless self[pos].face_up
    self[pos].value
  end

  def hide(pos)
    self[pos].hide if self[pos].face_up
  end

end
