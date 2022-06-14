class KnightPathFinder
  def valid_moves(pos)
    
  end

  att_reader :root_node

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