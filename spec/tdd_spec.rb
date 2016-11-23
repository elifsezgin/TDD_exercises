require "tdd"

describe "Array" do
  subject(:array) { Array.new }

  describe "#my_uniq" do
    context "when self is empty" do
      it "returns empty" do
        expect(array.my_uniq).to be_empty
      end
    end

    context "when self is not empty" do
      subject(:array) { [1, 2, 1, 3, 3] }
      it "returns an array of uniq values" do

        expect(array.my_uniq).to eq([1, 2, 3])
      end

      it "returns a new array" do
        array.my_uniq
        expect(array).to eq([1, 2, 1, 3, 3])
      end
    end
  end

  describe "#two_sum" do
    context "finds pairs in array that equals zero" do
      it "returns empty when self is empty" do
        expect(array.two_sum).to be_empty
      end

      it "returns array of indexes for pairs equaling zero" do
        array = [-1, 0, 2, -2, 1]
        expect(array.two_sum).to eq([[0, 4], [2, 3]])
      end
    end
  end

  describe "#my_transpose" do
    context "transposes a two-dimensional grid of numbers" do
      rows = [
              [0, 1, 2],
              [3, 4, 5],
              [6, 7, 8]
             ]
      cols = [
              [0, 3, 6],
              [1, 4, 7],
              [2, 5, 8]
             ]
      it "returns transposed array" do
        expect(rows.my_transpose).to eq(cols)
      end
    end

    context "if subsequent lines are shorter than first" do
      rows = [
              [0, 1, 2],
              [3, 4],
              [6]
             ]
      cols = [
              [0, 3, 6],
              [1, 4, nil],
              [2, nil, nil]
             ]
      it "adds nil for missing values" do
        expect(rows.my_transpose).to eq(cols)
      end
    end
  end

  describe "#stock_picker" do
    context "finds the most profitable days to buy and then sell" do
      it "returns the indexes of the greatest and lowest days" do
        array = [1, 2, 3, 4, 5]
        expect(array.stock_picker).to eq([0, 4])
      end

      it "ignores large values at the beginning of the array" do
        array = [9, 2, 3, 5, 1]
        expect(array.stock_picker).to eq([1, 3])
      end

      it "returns indexes of largest difference" do
        array = [9, 2, 8, 1, 6, 1]
        expect(array.stock_picker).to eq([1, 2])
      end
    end
  end
end

describe "TowersofHanoi" do
  subject(:game) { TowersofHanoi.new }
  describe "#move" do
    it "moves from tower1 to tower2" do
      game.move(0, 1)
      expect(game.towers).to eq([[3, 2], [1], []])
    end
    it "cannot move onto a smaller value" do
      game.move(0, 1)
      expect(game.move(0, 1)).to eq("Invalid move")
    end
  end

  describe "#won?" do
    it "returns false when game initializes" do
      expect(game.won?).to be false
    end

    it "returns false when the game isn't finished" do
      game.move(0, 1)
      expect(game.won?).to be false
    end

    it "returns true if all pieces are moved to new tower" do
      game.move(0, 1)
      game.move(0, 2)
      game.move(1, 2)
      game.move(0, 1)
      game.move(2, 0)
      game.move(2, 1)
      game.move(0, 1)
      expect(game.won?).to be true
    end
  end
end






























#
