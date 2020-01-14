require 'rails_helper'

RSpec.describe Game, type: :model do
let!(:game) { FactoryBot.create(:game) }
let!(:chess_piece) { FactoryBot.create(:chess_piece, position_x: 1, position_y: 1, game_id: game.id)}

  describe 'space_occupied?' do  
    it 'returns true if there is a piece on the provided space' do
      expect(game.space_occupied?(1, 1)).to be true
    end

    it 'returns true if there is a piece on the provided space' do
      expect(game.space_occupied?(1, 2)).to be false
    end

    it 'return true if there is a piece on the provided space' do
      game1 = FactoryBot.create(:game)
      game1.fill_for_testing
      expect(game1.space_occupied?(0, 0)).to be true
    end
  end
  
  describe 'is_obstructed?' do
    it 'should return false if diagonal_obstruction' do
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game1 = FactoryBot.create(:game) #Arrange
      game1.fill_for_testing
      result = game1.is_obstructed?([0, 5], [2, 3]) #Act
      expect(result).to eq false #Assert 
    end
    
    it 'should return true if diagonal_obstruction' do 
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game1 = FactoryBot.create(:game) #Arrange
      game1.fill_for_testing
      result = game1.is_obstructed?([5, 0], [3, 2]) #Act
      expect(result).to eq true #Assert 
    end  
  
    it 'should return true if vertical_obstruction' do 
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game1 = FactoryBot.create(:game) #Arrange
      game1.fill_for_testing
      result = game1.is_obstructed?([0, 0], [0, 4]) #Act
      expect(result).to eq true #Assert 
    end  

    it 'should return invalid_move if diagonal, horizontal and vertical_obstruction' do  
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game1 = FactoryBot.create(:game) #Arrange
      game1.fill_for_testing
      result = game1.is_obstructed?([3, 3], [1, 4]) #Act
      expect(result).to eq fail #Assert 
    end  

    it 'should return false if vertical_obstruction' do  
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game1 = FactoryBot.create(:game) #Arrange
      game1.fill_for_testing
      result = game1.is_obstructed?([0, 7], [0, 5]) #Act
      expect(result).to eq false #Assert 
    end 

    it 'should return true if horizontal_obstruction' do  
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game1 = FactoryBot.create(:game)#Arrange
      game1.fill_for_testing
      result = game1.is_obstructed?([0, 7], [5, 7]) #Act
      expect(result).to eq true #Assert
    end
  end
end


#is_obstructed? A6 -> C4 => false
#is_obstructed? F1 -> D3 => true
#is_obstructed? A1 -> A4 => true