module Enumerable
  
  def my_each
    if self.class == Array
      self.length.times { |index| yield self[index] }
    elsif self.class == Hash
      for key in self.keys
        yield key, self[key]
      end
    end
  end
  
  def my_each_with_index
    if self.class == Array
      self.length.times { |index, i | yield self[index], i  }      
    end

    if self.class == Hash
      for i in self.keys
        yield(i, self[i])
      end
    end
  end
  
  def my_select
    if self.class == Array
      return_arr =  []
      self.my_each do |element|
        if yield (element)
          return_arr.push(element)
        end
      end
    return_arr
    elsif self.class == Hash
      new_hash = {}
      self.my_each do |key, value|
        if yield(key, value)
          new_hash[key] = value
        end
      end
      new_hash
    end
  end

  def my_all?
    if self.class == Array
      self.my_each do |element|
      if !yield(element)
        return false
      end
    end
    elsif
      if self.class == Hash
        self.my_each do | key, value |
          if !yield(key, value)
          return false
        end 
      end
      end      
    end
    true
  end
  
  def my_any?
    if self.class == Array
      self.my_each do |element|
      if yield(element)
        return true
      end
    end    
    elsif self.class == Hash
      self.my_each do | key, value |
        if yield(key, value)
          return true
        end
      end
    end
  end

  def my_none?
    if self.class == Array
      self.my_each do |element|
        unless yield(element)
          return true
        end
      end
      elsif self.class == Hash
      self.my_each do | key, value |
        unless yield(key, value)
         return true
        end
      end
    end
    false
  end

  def my_count
    return self.size unless block_give?
    count = 0
    if self.class == Array
      self.my_each { |item|  count += 1 if yield item }
    elsif self.class == Hash
      self.my_each { |key, value|  count += 1 if yield key, value} 
    end
    count
  end

  def my_map(proc = "default")
    result = []
    if self.class == Array
      if proc.class == Proc
        self.my_each { | num |  result.push(proc.call(num))}
      else
      self.my_each { | num |  result.push(yield(num))}
      end
    elsif self.class == Hash
      if proc.class == Proc
        self.my_each { | key, value |  result.push(proc.call(key, value))}
      else
      self.my_each { | key, value |  result.push(yield(key, value))}
    end
  else
    return "You cannot use this method on #{self.class} class"
  end
    result
  end

  def my_inject(acc = "")
    rest_items = self
    if self.class == Array
      if acc == ""
        acc = self[0]
        rest_items = self[1..-1]
      end
      rest_items.my_each { |value|  acc = yield acc, value}

      elsif self.class == Hash
      if acc == ""
        acc = self[self.keys[0]]
        rest_items.delete(rest_items.keys[0])
      end
      rest_items.my_each { |key, value|  acc = yield acc, key, value}
    end    
    acc
  end

  def multiply_els
    if self.class == Array
    self.my_inject { | acc, value |  acc * value }
    end

    if self.class == Hash
      self.my_inject { | acc, key, value |  acc * value }
    end
  end

end


include Enumerable

# Tests
# [ 3 , 7 ].my_each_with_index { | num, i | puts num }
# hash = {a:9, b:10}
# puts hash.my_any? { | key, value | hash.key? (key) }
# puts hash.my_all? { | key, value | !key.nil? }
# puts [3 , 7].multiply_els 
#  [1, 2].my_inject(4) { | acc, num | acc + num }
# puts  hash.my_inject(5) { | acc, key, value | acc + value * 2 }
# [1, 2, 3, 4, 5, 8, 9].my_each { | num | puts num }
# { a:1, b:2 }.my_each { | key, value | puts value}
# [1, 2, 3, 4, 5, 8, 9].my_count { | num | num}
#  %w{ ant bear cat }.none? { | word | word.length == 5 }
#  %w[ant bear cat].my_any? { | word | word.length >= 3 }
# [1, 2, 3, 4, 5, 8, 9].my_select { | num |  num.odd? }
# h = { "a" => 100, "b" => 200 }
# h.my_each_with_index { | key, value | puts "#{key} is #{value}" }