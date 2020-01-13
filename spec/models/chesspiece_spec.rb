require 'rails_helper'

def getDefaultGame
  return new Game()

end

class Point
  attr_accessor(:x, :y)

  initialize(x, y) {
    @x = x
    @y = y
  }

  def to_location() #A1 
    x_axis = [ 'A', 'B', 'C', 'D', 'E', 'F']
    return x_axis[@x] + (@y + 1)
  end

  def self.form_location(location) 
    x = 0
    y = 0

    if (location[0] == 'A') x = 0
    elsif (location[0] == 'B') x = 1
    elsif (location[0] == 'C') x = 2
    elsif (location[0] == 'D') x = 3

    y = location[1].to_i - 1

    return new Point(x, y))

  end

end

RSpec.describe ChessPiece, type: :model do #(Creatated automatically when model was created)
  describe 'is_obstructed? method' do

    it 'should return false if diagonal_obstruction' do
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game = getDefaultGame #Arrange
      start = Point.from_location('A6')
      end = Point.from_location('C4')

      result = game.is_obstructed?(start.x, start.y, end.x, end.y) #Act
      expect(result).to be(:false) #Assert 
    end
    
    it 'should return true if diagonal_obstruction' do 
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game = getDefaultGame #Arrange
      result = game.is_obstructed?('F1', 'D3') #Act
      expect(result).to be(:true) #Assert 
    end  
  
    it 'should return true if horizontal and vertical_obstruction' do 
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game = getDefaultGame #Arrange
      result = game.is_obstructed?('A1', 'C4') #Act
      expect(result).to be(:true) #Assert 
    end  

    it 'should return invalid_move if diagonal, horizontal and vertical_obstruction' do  
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game = getDefaultGame #Arrange
      result = game.is_obstructed?('D4', 'B5') #Act
      expect(result).to be(:invalid_move) #Assert 
    end  

    it 'should return false if vertical_obstruction' do  
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game = getDefaultGame #Arrange
      result = game.is_obstructed?('A8', 'A6') #Act
      expect(result).to be(:false) #Assert 
    end  
  
    it 'should return false if horizontal_obstruction' do  
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game = getDefaultGame #Arrange
      result = game.is_obstructed?('A8', 'C8') #Act
      expect(result).to be(:false) #Assert
    end   
  end  
end
