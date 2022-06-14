# TODO, continue from phase1. Valid moves are not
class KnightPathFinder
  X = [-2, -2, -1, -1, 1, 1, 2, 2]
  Y = [-1, 1, -2, 2, -2, 2, -1, 1]
  
  def valid_moves(pos)
    row, col = pos 
    possible_pos = []
    X.each_index do |i|
      next_row, next_col = row + X[i], col + Y[i]
      next if next_row >= 0 && next_col >= 0
      possible_pos << [next_row, next_col] 
    end

    possible_pos
  end

  attr_reader :root_node

  def initialize(pos)
    @board = init_board(8, pos)
    @root_node = set_root_node
    build_move_tree(root_node)
  end

  def set_root_node(init_pos)
    row, col = init_pos
    @board[row][col] 
  end

  def build_move_tree(root)
  end

  private
  
  def init_board(size, start_pos)
    # Initializes board with startin position
    grid = Array.new(8) { Array.new(8) { PolyTreeNode.new } }
    row, col = start_pos
    grid[row][col] = start_pos 

    grid
  end
end
