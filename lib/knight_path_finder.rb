require_relative  'poly_tree_node'
require 'byebug'

class KnightPathFinder
  X = [-2, -2, -1, -1, 1, 1, 2, 2]
  Y = [-1, 1, -2, 2, -2, 2, -1, 1]
  
  def self.valid_moves(pos)
    row, col = pos 
    possible_pos = []
    X.each_index do |i|
      next_row, next_col = row + X[i], col + Y[i]
      next unless next_row.between?(0,7) && next_col.between?(0,7)
      possible_pos << [next_row, next_col] 
    end

    possible_pos
  end

  attr_reader :root_pos

  def initialize(pos)
    @root_pos = pos
    @considered_positions = [pos]

    build_move_tree
  end

  private

  attr_accessor :root_node

  def build_move_tree
    self.root_node = PolyTreeNode.new(root_pos)
    queue = [root_node]

    until queue.empty?
      fifo = queue.shift 
      curr_pos = fifo.node_value
      new_move_positions(curr_pos).each do |pos|
        next_node = PolyTreeNode.new(pos)
        next_node.add_child(next_node)
        queue << next_node
      end
    end
  end

  def new_move_positions(pos)
    moves = KnightPathFinder.valid_moves(pos)
    remaining_moves = moves.select { |move| !@considered_positions.include?(move) }
    @considered_positions += remaining_moves

    remaining_moves
  end
end
