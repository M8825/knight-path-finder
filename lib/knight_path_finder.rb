class KnightPathFinder
  def initialize(pos)
    @board = init_board(8)
  end

  private
  
  def init_board(size)
    Array.new(8) { Array.new(8) { PolyTreeNode.new } }
  end
end 