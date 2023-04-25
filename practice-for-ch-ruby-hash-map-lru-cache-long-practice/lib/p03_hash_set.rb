require 'byebug'
class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    #debugger
    return false if include?(key.hash)
    self[key.hash] << key && @count += 1 if !self.include?(key)
    if @count == num_buckets 
      @count = 0
      resize!
    end
  end

  def include?(key) #[[]]
    self[key.hash].include?(key)
  end


  def remove(key)
    if include?(key)
      self[key.hash].delete(key)
      @count -=1
    end
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_copy = @store.dup.flatten

    @store = Array.new(num_buckets * 2){Array.new}

    old_copy.each { |ele| insert(ele)}
  end

  def [](num)
    @store[num % num_buckets] 
    # optional but useful; return the bucket corresponding to `num`
  end
end