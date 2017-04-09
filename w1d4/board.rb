require_relative "tile"
require "byebug"

class Board

  def self.empty_grid
    Array.new(9) { Array.new(9) }
  end

  def initialize(grid = Board.empty_grid)
    @grid = grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, tile)
    row, col = pos
    @grid[row][col] = tile
  end

  def populate
    ary = []
    15.times { ary << 1 }
    (81 - 15).times { ary << 0 }
    ary.shuffle!
    @grid.each_with_index do |row, i|
      row.each_index do |j|
        pos = [i, j]
        if ary.pop == 0
          self[pos] = Tile.new(false)
        else
          self[pos] = Tile.new(true)
        end
        self[pos].pos = pos
      end
    end
  end

  def set_neighbors
    locs = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    @grid.each_with_index do |row, i|
      row.each_with_index do |tile, j|
        arr = locs.map { |loc| add_pos(loc, [i, j]) }
        arr.select! { |loc| valid_pos?(loc) }
        neighbors = arr.map { |pos| self[pos] }
        tile.set_neighbors(neighbors)
      end
    end
  end

  def reveal_tiles(pos)
    tile = self[pos]
    tile.reveal
    tile.zero_bomb_neighbors.each do |neigh|
      reveal_tiles(neigh.pos)
    end
  end

  def valid_pos?(pos)
    return false unless pos.is_a?(Array) && pos.size == 2
    row, col = pos
    (0...9).cover?(row) && (0...9).cover?(col)
  end

  def won?
    @grid.flatten.all? { |tile| tile.revealed? || tile.bomb? }
  end

  def render
    @grid.each do |row|
      puts "| #{row.map(&:to_s).join(' ')} |"
    end
  end

  private

  def add_pos(pos_one, pos_two)
    [pos_one[0] + pos_two[0], pos_one[1] + pos_two[1]]
  end

end

b = Board.new
b.populate
b.set_neighbors
