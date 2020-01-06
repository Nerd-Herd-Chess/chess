require 'rails_helper'

def getDefaultGame
  return new Game()

end

RSpec.describe ChessPiece, type: :model do #(Creatated automatically when model was created)
  describe 'is_obstructed? method' do

    it 'should return false if diagonal_obstruction' do
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game = getDefaultGame #Arrange
      result = game.is_obstructed?('A6', 'C4') #Act
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
