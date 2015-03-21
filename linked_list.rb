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
    new_node = ListNode.new(value, self.last, @end)
    self.last.child = new_node
    self.last = new_node
    @length += 1
  end

  def pop
    if @length > 1
      top = self.last.value
      self.last = self.last.parent
      @length -= 1
      return top.value
    else
      return nil
    end
  end

  def shift
    if @length > 1
      bottom = self.first.value
      self.first = self.first.child
      @length -= 1
      return bottom.value
    else
      return nil
    end
  end

  def unshift(value)
    new_node = ListNode.new(value, @start, self.first)
    self.first.parent = new_node
    self.first = new_node
    @length += 1
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

  def initialize(value = nil, parent = nil, child = nil)
    @parent = parent
    @child = child
    @value = value
  end
end
