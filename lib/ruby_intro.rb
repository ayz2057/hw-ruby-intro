# When done, submit this entire file to the autograder.

# Part 1

def sum(arr)
  sum = 0
  arr.each {|elt| sum += elt}
  sum
end

def max_2_sum(arr)
  return 0 if arr.size == 0
  return arr[0] if arr.size == 1
  max_val = arr.max
  if (arr.filter { |elt| elt == max_val}).size > 1 
    return 2*max_val
  else
    return max_val + (arr.filter { |elt| elt != max_val}).max
  end
end

def sum_to_n?(arr, n)
  return false if arr.size < 2
  n_minus_elt = Hash.new(0)
  arr.each do |elt|
    n_minus_elt[n-elt] += 1
  end
  arr.each do |elt| 
    if (n_minus_elt.key?(elt))
      if (2 * elt == n) 
        return (n_minus_elt[elt] > 1) 
      else
        return true
      end
    end
  end
  return false
end

# Part 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant?(s)
  return false if s.size == 0
  "bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ".include?(s[0])
end

def binary_multiple_of_4?(s)
  return (s == "0" || s == "00") if s.size < 3
  s.each_char do |char| 
    return false if (char != "0" && char != "1")
  end
  return s[-2..-1] == "00"
end

# Part 3

class BookInStock
  def initialize(isbn, price)
    if (isbn=="") || (!isbn.is_a?(String)) || (price <= 0)
      raise ArgumentError
    end
    @isbn = isbn
    @price = price
  end
  attr_accessor :isbn, :price

  def price_as_string
    format("$%.2f", price)
  end
end
