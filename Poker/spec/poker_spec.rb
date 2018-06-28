require 'card'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  
  describe "#initialize" do
    it "Initializes a deck with 52 cards" do
      expect(deck.size).to eq 52
    end
  end
end

describe Card do
  subject(:card) { Card.new(:hearts, 'Q')}
  
  describe "#initialize" do
    it "Initializes with a value and suit" do
      expect(card.value).to eq 'Q'
      expect(card.suit).to eq :hearts
    end
  end
end