require 'tdd'

RSpec.describe do
  
  describe Array do
    describe "#my_uniq" do
      subject(:arr) { [1, 2, 2, 3, 1, 4] }
      
      it "returns an empty base case" do
        expect([].my_uniq).to eq([])
      end
      
      it "returns an array of one element" do
        expect([1].my_uniq).to eq([1])
      end    
      
      it "removes duplicates" do
        expect(arr.my_uniq).to eq(arr.uniq)
      end
    end
    
    describe "#two_sum" do
      subject(:arr) { [-1, 0, 2, -2, 1] }
      
      it "returns a pair if indices that sum to zero" do
        expect(arr.two_sum).to eq([[0, 4], [2, 3]])
      end
    end
  end
  
  describe "#my_transpose" do
    subject(:matrix) {[
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]}
    
    let(:transpose) {[
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]}
    
    it "transposes the array" do
      expect(my_transpose(matrix)).to eq(transpose)
    end
  end
    
  describe "#stock_picker" do
    let(:stocks) {[100, 120, 90, 110, 85, 190]}
    it "finds the most profitable pair" do
      expect(stock_picker(stocks)).to eq([4, 5])
    end
    
    before(:each) { stocks << 70 }
    it "doesn't sell stock before it buys" do
      expect(stock_picker(stocks)).to eq([4, 5])
    end
  end
end







