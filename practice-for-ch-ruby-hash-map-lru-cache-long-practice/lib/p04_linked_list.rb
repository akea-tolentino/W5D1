class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end

end

class LinkedList
  
  def initialize
    @head = Node.new 
    @tail = Node.new
    @head.next = @tail 
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next 
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    if !empty?
        return first.val if first.key == key
        node = first.next unless first.next == @tail
        until node.key == key 
          return nil if node.next == @tail
          node = node.next 
        end
        return node.val 
    end  

  end

  def include?(key)
    if !empty?
      return true if first.key == key
      node = first.next unless first.next == @tail
      until node.key == key 
        return false if node.next == @tail
        node = node.next 
      end
      return true
    end  
  end

  def append(key, val)
    # adding something before tail 
    new_last = Node.new(key,val)
    new_last.next = @tail
    new_last.prev = @tail.prev
    @tail.prev.next = new_last 
    @tail.prev = new_last 

  end

  def update(key, val)
    if !empty?
      if first.key == key 
        first.val = val
      else
        node = first.next unless first.next == @tail
        until node.key == key && node.next != @tail
          raise "doesn't exist" if node.next == @tail
          node = node.next 
        end
        node.val = val 
      end
    end  
  end

  def remove(key)
    #set prev next to removed next 
    #removed next prev to 
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end