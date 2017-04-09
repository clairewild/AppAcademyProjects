class Tile

  attr_accessor :flag, :pos

  def initialize(bomb = false)
    @flag = false
    @revealed = false
    @bomb = bomb
    @neighbors = []
    @pos = []
  end

  def set_neighbors(arr)
    @neighbors = arr
  end

  def reveal
    @revealed = true
  end

  def flagged?
    @flag
  end

  def revealed?
    @revealed
  end

  def bomb?
    @bomb
  end

  def neighbor_bomb_count
    count = 0
    @neighbors.each do |tile|
      count += 1 if neighbor.bomb?
    end
    count
  end

  def zero_bomb_neighbors
    @neighbors.select { |tile| tile.neighbor_bomb_count.zero? }
  end

  def to_s
    if revealed?
      count = neighbor_bomb_count
      count.zero? ? " " : count.to_s
    elsif flagged?
      "f"
    else
      "-"
    end
  end

end
