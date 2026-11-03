module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    self.my_each do |item|
      yield(item, index)
      index += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    selection_arr = []
    self.my_each do |item|
      selection_arr << item if yield(item)
    end
    selection_arr
  end

  def my_all?
    true_arr = []
    self.my_each do |item|
      true_arr << true if yield(item)
    end
    true_arr.length == self.length ? true : false
  end

  def my_any?
    self.my_each do |item|
      return true if yield(item)
    end
    false
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for item in self
      yield(item)
    end
  end
end
