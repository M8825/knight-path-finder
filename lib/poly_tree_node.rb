class PolyTreeNode
  attr_reader :node_value

  def initialize(val)
    @node_value = val
    @children = []
  end

  def add_child(pos)
    @children << pos
  end
end