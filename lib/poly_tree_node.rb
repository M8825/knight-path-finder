class PolyTreeNode
  # TODO, refactor_value into value
  attr_reader :value, :children, :parent

  def initialize(val)
    @value = val
    @parent = nil
    @children = []
  end

  def add_child(pos)
    @children << pos
  end

  def parent=(parent_node)
    @parent.children.delete(self) unless @paretn.nil?
    @parent = parent_node
    parent_node.children << self unless parent_node.nil?
  end

  def bfs(target)
    return self if @value == target

    @children.each do |child|
      search_res = child.bfs(target)
      return search_res unless search_res.nil?
    end
    nil
  end

  def inspect
    {value: @value,
      parent: @parent}.inspect
  end
end