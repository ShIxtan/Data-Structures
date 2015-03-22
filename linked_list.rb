class ListNode
  attr_accessor :value, :parent, :child

  def initialize(value = nil, parent = nil, child = nil, list = nil)
    @list = list
    @parent = parent
    @child = child
    @value = value
  end

  def remove()
    @list.remove(self)
  end

  def insert_after(value)
    @list.insert(value, self, :after)
  end

  def insert_before(value)
    @list.insert(value, self, :before)
  end
end

class LinkedList
  def initialize()
    @sentinel = ListNode.new()
    @sentinel.parent = @sentinel.child = @sentinel
    @length = 0
  end

  def last
    @length > 0 ? @sentinel.parent : nil
  end

  def first
    @length > 0 ? @sentinel.child : nil
  end

  def push(value)
    self.insert(value, @sentinel, :before)
  end

  def pop
    if @length > 0
      top = self.last
      return self.remove(top).value
    else
      return nil
    end
  end

  def shift
    if @length > 0
      bottom = self.first
      return self.remove(bottom).value
    else
      return nil
    end
  end

  def unshift(value)
    self.insert(value, @sentinel)
  end

  def insert(value, node = @sentinel.parent, direction = :after)
    if direction == :after
      node.child = node.child.parent = ListNode.new(value, node, node.child, self)
    else
      node.parent = node.parent.child = ListNode.new(value, node.parent, node, self)
    end
    @length += 1
  end

  def remove(node)
    node.child.parent, node.parent.child = node.parent.child, node.child.parent
    @length -= 1
    return node
  end

  def [](index)
    return nil if index >= @length || index < 0
    node = self.first

    index.times do
      node = node.child
    end

    return node
  end

  def []=(index, value)
    return nil if index >= @length || index < 0
    node = self.first

    index.times do
      node = node.child
    end

    node.value = value
    return value
  end
end
