class MaxIntSet
  attr_reader :max, :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' if num > max || num < 0
    @store[num] = true
      
  end

  def remove(num)
    raise 'Out of bounds' if num > max || num < 0
    @store[num] = false
  end

  def include?(num)
    raise 'Out of bounds' if num > max || num < 0
    @store[num]
  end

  private

  def is_valid?(num)

  end

  def validate!(num)
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    idx = num % num_buckets
    self[idx] << num if !self[idx].include?(num)
  end

  def remove(num)
    idx = num % num_buckets
    if include?(num)
      self[idx].delete(num)
    end
  end

  def include?(num)
    idx = num % num_buckets
    self[idx].include?(num)
  end

  private

  def [](num)
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    idx = num % num_buckets
    self[idx] << num && @count += 1 if !self[idx].include?(num)
    if @count == num_buckets 
      @count = 0
      resize!
    end
  end

  def remove(num)
    idx = num % num_buckets
    if include?(num)
      self[idx].delete(num)
      @count -=1
    end
  end

  def include?(num)
    idx = num % num_buckets
    self[idx].include?(num)
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
  end
end