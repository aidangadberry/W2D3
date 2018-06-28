# high card
# pair 
# two pair
# three of a kind
# straight
# flush
# full house
# four of a kind
# straight flush
# royal flush
# 
# 
# sum value
require_relative 'card'
require_relative 'deck'
POSSIBLE_HANDS = [:strfl, :four, :full, :fl, :str, 
                  :triple, :double, :pair, :high]
class Hand
  
  
  def initialize(hand)
    @hand = hand
  end
  
  def self.compare(first_hand, second_hand)
    hand1 = first_hand.sort.best_hand
    hand2 = second_hand.sort.best_hand
    settle(first_hand, second_hand, hand1) if hand1 == hand2
    
    POSSIBLE_HANDS.index(hand1) < POSSIBLE_HANDS.index(hand2)
    
  end
  
  def self.settle(first_hand, second_hand, hand_type)
    case hand_type
    when :strfl, :str
      first_hand.highest_card <=> second_hand.highest_card
      
    end
  end
  
  def best_hand
    return :strfl if hand.is_flush? && hand.is_straight?
    return :four if hand.highest_combination == 4
    return :full if hand.highest_combination == 3 && hand.to_values.uniq.length == 2
    return :fl if hand.is_flush?
    return :str if hand.is_straight?
    return :triple if hand.highest_combination == 3
    return :double if hand.to_values.uniq.length == 3
    return :pair if hand.contains_duplicates?
    return :high
  end
  
  def highest_combination
    counter = Hash.new(0)
    hand.to_values.each{|value| counter[value] += 1}
    counter.keys.max
  end
  
  private
  
  def highest_card
    hand.sort.to_values.max
  end
  
  def sort
    hand.sort_by { |a, b| a.value <=> b.value }
  end
  
  def is_flush?
    suit = hand[0].suit
    hand.all? { |card| card.suit == suit }
  end
  
  def is_straight?
    return false if hand.contains_duplicates?
    return true if hand[0].value == hand[4].value - 4
    return true if hand[4].value == 12 && hand[0].value == 2 && hand[3].value == 3
  
    false
  end
  
  def contains_duplicates?
    hand.to_values != hand.to_values.uniq
  end
  
  def to_values
    hand.map { |card| card.value }
  end
end