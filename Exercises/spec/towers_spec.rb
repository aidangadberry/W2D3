require 'towers'
RSpec.describe do
  describe Tower do
    subject(:game) { Tower.new }
    
    describe "#initialize" do
      it "creates starting towers" do
        expect(game.towers).to eq([[3, 2, 1], [], []]) 
      end
    end
    
    describe "#move" do
      before(:each) { game.move(0, 2) }
      
      it "removes disc from starting tower" do
        expect(game.towers[0].length).to eq 2
      end
      
      it "adds disc to ending tower" do
        expect(game.towers[2].length).to eq 1
      end
    end
    
    describe "#valid_move?" do
      before(:each) { game.move(0, 1) }
      
      it "returns true for a valid move" do
        expect(game.valid_move?(0, 2)).to be true
      end
    
      it "returns false for an empty starting tower" do
        expect(game.valid_move?(2, 0)).to be false
      end
    
      it "returns false if starting disc is bigger than ending disc" do
        expect(game.valid_move?(0, 1)).to be false
      end
      
      it "returns false if either tower does not exist" do
        expect(game.valid_move?(5, 0)).to be false
      end
      
    end
    
    describe "#turn" do
      it "gets a move from player" do
        expect(game).to receive(:get_input).and_call_original
        game.turn
      end
      
      it "calls the method valid move" do
        expect(game).to receive(:valid_move?)
        game.turn
      end
      
      it "calls the method move on a valid move" do
        expect(game).to receive(:move)
        game.turn
      end
    end
  end
end