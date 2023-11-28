limit = 10

module Squares
  def self.difference_of_squares (limit : Int32) : Int32
    puts square_of_sum(limit) - sum_of_squares(limit)
  end

  def self.sum_of_squares (limit : Int32) : Int32
      sum = 0
      count = 1
      while count < limit+1
        sum += count**2
        count += 1
      end
      sum
    end

    def self.square_of_sum (limit : Int32) : Int32
      sum = 0
      count = 1
      while count < limit+1
        sum += count
        count += 1
      end
      sum**2
    end

  # Write your code for the 'Difference Of Squares' exercise in this file.
end
