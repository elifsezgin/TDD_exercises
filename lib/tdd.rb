class Array

  def my_uniq
    unq = []
    self.each do |el|
      unq << el unless unq.include?(el)
    end
    unq
  end

  def two_sum
    two = []
    self.each_with_index do |el1, idx1|
      idx2 = idx1 + 1
      while idx2 < self.length
        two << [idx1, idx2] if el1 + self[idx2] == 0
        idx2 += 1
      end
    end
    two
  end

  def my_transpose
    transposed = Array.new(self[0].length) { Array.new(self.length) }

    each_with_index do |row, idx1|
      row.each_with_index do |cell, idx2|
        transposed[idx2][idx1] = cell
      end
    end
    transposed
  end

  def stock_picker
    difference = 0
    day1 = 0
    day2 = 0
    self.each_with_index do |el, idx|
      idx2 = idx + 1
      while idx2 < self.length
        if difference < self[idx2] - el
          difference = self[idx2] - el
          day1 = idx
          day2 = idx2
        end
        idx2 +=1
      end
    end
    [day1, day2]
  end
end

class TowersofHanoi
  attr_reader :towers

  def initialize
    @towers = [[3,2,1], [], []]
  end

  def move(from, to)
    piece = towers[from].pop
    if towers[to].empty? || towers[to].last > piece
      towers[to].push(piece)
    else
      towers[from].push(piece)
      "Invalid move"
    end
  end

  def won?
    towers[1] == [3, 2, 1] || towers[2] == [3, 2, 1]
  end

end






















#
