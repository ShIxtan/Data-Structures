class LinkedList
  def initialize()
    @start = ListNode.new()
    @end = ListNode.new()
    self.last = @start
    @length = 0
  end

  def last
    length > 0 ? @end.parent : nil
  end

  def first
    length > 0 ? @start.child : nil
  end

  def push(value)
    self.insert(value, @end, :before)
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
    self.insert(value, @start)
  end

  def insert(value, node = @last.parent, direction = :after)
    if direction == :after
      node.child = node.child.parent = new ListNode(value, node, node.child, self)
    else
      node.parent = node.parent.child = new ListNode(value, node.parent, node, self)
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

    return node.value
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

  private

  def last=(node)
     @end.parent = node
     node.child = @end
  end

  def first=(node)
    @start.child = node
    node.parent = @start
  end
end

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
