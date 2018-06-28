require_relative 'card'

class Deck
  # SUITS = %w(♠️,♣️,♥️,♦️)
  SUITS = [:diamonds, :hearts, :clubs, :spades]
  VALUES = %w(2 3 4 5 6 7 8 9 T J Q K A)
  def initialize
    @deck = Deck.standard_deck
  end
  
  def self.standard_deck
    standard_deck = []
    
    SUITS.each do |suit|
      VALUES.each do |value|
        standard_deck << Card.new(suit, value)
      end
    end
    
    standard_deck.shuffle
  end
  
  def size
    @deck.length
  end
  
  def to_s
    puts "deck"
  end

  
  private

  
  attr_reader :deck
end
