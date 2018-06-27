class Array
  def my_uniq
    return self if self.length <= 1
    
    result = []
    
    self.each { |el| result << el unless result.include?(el) }
    result
  end
  
  def two_sum
    result = []
    
    self.each_with_index do |el1, idx1|
      self[idx1 + 1..-1].each_with_index do |el2, idx2|
        result << [idx1, idx1 + idx2 + 1] if el1 + el2 == 0
      end
    end
    
    result
  end
end


def my_transpose(arr)
  transpose = Array.new(3){ [] }
  arr.each do |row|
    row.each_with_index do |el, j|
      transpose[j] << el
    end
  end
  transpose
end

def stock_picker(stocks)
  max_profit = 0
  best_pair = []
  
  stocks.each_with_index do |buy, buy_idx|
    stocks[buy_idx + 1..-1].each_with_index do |sell, sell_idx|
      profit = sell - buy
      if profit > max_profit 
        best_pair = [buy_idx, buy_idx + sell_idx + 1]
        max_profit = profit 
      end
    end
  end
  
  best_pair
end
