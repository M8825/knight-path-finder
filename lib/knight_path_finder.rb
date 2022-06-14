require_relative  'poly_tree_node'

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

  def find_path(end_pos)
    # BFS appproach
    target = root_node.bfs(end_pos)
    trace_path_back(target).reverse
  end

  private

  attr_accessor :root_node

  def build_move_tree
    self.root_node = PolyTreeNode.new(root_pos)
    queue = [root_node]

    until queue.empty?
      curr_node = queue.shift 
      curr_pos = curr_node.value
      new_move_positions(curr_pos).each do |pos|
        child_node = PolyTreeNode.new(pos)
        curr_node.add_child(child_node)
        child_node.parent = curr_node
        queue << child_node
      end
    end
  end

  def new_move_positions(pos)
    moves = KnightPathFinder.valid_moves(pos)
    remaining_moves = moves.select { |move| !@considered_positions.include?(move) }
    @considered_positions += remaining_moves

    remaining_moves
  end

  def trace_path_back(trgt)
    return [trgt.value] if trgt == root_node
    [trgt.value] + trace_path_back(trgt.parent)
  end
end

if __FILE__ == $PROGRAM_NAME
  kpf = KnightPathFinder.new([0, 0])
  p kpf.find_path([7, 6]) == [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
  p kpf.find_path([6, 2]) == [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]  
end
