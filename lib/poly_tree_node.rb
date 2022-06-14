class PolyTreeNode
  att_accessor :node_value

  def initialize(val = 0)
    @node_value = val
  end

  def []=(val)
    @node_value == val
  end
end