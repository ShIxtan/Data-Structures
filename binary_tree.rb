class TreeNode
  attr_accessor :parent, :left, :right, :value

  def initialize(value, parent = nil)
    @value = value
    @left = nil
    @right = nil
    @parent = parent
  end

  def leaf?
    return true unless @left || @right
  end

  def dfs(target)
    return self if value == target
    return nil if leaf?

    return dfs(@left) || dfs(@right)
  end
end
