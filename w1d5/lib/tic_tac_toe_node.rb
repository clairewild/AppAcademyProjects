require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      return true unless board.winner == evaluator
      return false if (board.winner.nil? || board.winner == evaluator)
    else
      self.children.none? do |child|
        child.losing_node?(evaluator)
      end
    end
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    nodes = []
    (0..2).each do |i|
      (0..2).each do |j|
        current_pos = [i, j]
        if @board.empty?(current_pos)
          nodes << TicTacToeNode.new(@board.dup, next_mark, current_pos)
        end
      end
    end
    nodes
  end

  def next_mark
    @next_mover_mark == :x ? :o : :x
  end
end
