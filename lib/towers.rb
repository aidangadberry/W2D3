class Tower
  attr_accessor :towers
  def initialize
    @towers = [[3, 2, 1], [], []]
  end
  
  def play
    until won?
      render
      turn
    end
    puts "You win!"
  end
  
  def won?
    towers[1].length == 3 || towers[2].length == 3
  end
  
  def turn
    begin
      move = get_input
      
      if valid_move?(move.first, move.last)
        move(move.first, move.last)
      else
        raise ArgumentError
      end
    rescue ArgumentError => e
      puts "Invalid move"
    end
  end
  
  def move(starting_tower, ending_tower)
    towers[ending_tower] << towers[starting_tower].pop
  end
  
  def valid_move?(starting_tower, ending_tower)
    return false unless starting_tower.between?(0, 2) && ending_tower.between?(0, 2)
    return false if towers[starting_tower].empty?
    
    start_disc = towers[starting_tower].last
    end_disc = towers[ending_tower].last || Float::INFINITY
    start_disc < end_disc
  end
  
  def get_input
    # gets.chomp
    [0, 1]
  end
  
  private
  

  
  def render
    towers.to_s
  end
end