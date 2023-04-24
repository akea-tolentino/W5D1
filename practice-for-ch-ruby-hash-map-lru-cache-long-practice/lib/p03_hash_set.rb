class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    idx = key.hash % num_buckets
    self[idx] << key.hash && @count += 1 if !self[idx].include?(key.hash)
    if @count == num_buckets 
      @count = 0
      resize!
    end
  end

  def include?(key)
    idx = key.hash % num_buckets
    self[idx].include?(key.hash)
  end


  def remove(key)
    idx = key.hash % num_buckets
    if include?(key)
      self[idx].delete(key.hash)
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
    @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end
end