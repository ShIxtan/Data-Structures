class TreeNode
  attr_accessor :parent, :left, :right

  def initialize(value, parent = nil)
    @left = nil
    @right = nil
    @parent = parent
  end
end
