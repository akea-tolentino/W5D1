class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    result=0
    self.each_with_index do |ele,index|
      result+= ele.hash * index
    end
    result
  end
end

class String
  def hash
    alphabet_range = ('a'..'z').to_a 
    result=0
    str_array = self.split('')
    # str_array.sort! 
    str_array.each.with_index do |char,index|
      result += alphabet_range.index(char.downcase).hash * index
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array=[]
    self.each do |key,value|
      array << [key,value]
    end
    array.sort.flatten.hash
  end
end