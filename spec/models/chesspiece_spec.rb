require 'rails_helper'

RSpec.describe ChessPiece, type: :model do #(Creatated automatically when model was created)
   describe 'is_obstructed?' do
    it 'should return false if diagonal_obstruction' do
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game1 = Game.create
      game1.fill_for_testing
      piece1 = Pawn.create(position_x: 0, position_y: 5, game_id: game1.id)
      result = expect(piece1.is_obstructed?(2, 3)).to be false
    end
    
    it 'should return true if diagonal_obstruction' do 
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game1 = Game.create
      game1.fill_for_testing
      piece1 = Pawn.create(position_x: 5, position_y: 0, game_id: game1.id)
      result = expect(piece1.is_obstructed?(3, 2)).to be true 
    end  
  
    it 'should return true if vertical_obstruction' do 
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game1 = Game.create
      game1.fill_for_testing
      piece1 = Pawn.create(position_x: 0, position_y: 0, game_id: game1.id)
      result = expect(piece1.is_obstructed?(0, 4)).to be true
    end  

    it 'should return invalid_move if diagonal, horizontal and vertical_obstruction' do  
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game1 = Game.create
      game1.fill_for_testing
      piece1 = Pawn.create(position_x: 3, position_y: 3, game_id: game1.id)
      result = expect(piece1.is_obstructed?(1, 4)).to raise_error 
    end  

    it 'should return false if vertical_obstruction' do  
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game1 = Game.create
      game1.fill_for_testing
      piece1 = Pawn.create(position_x: 0, position_y: 7, game_id: game1.id)
      result = expect(piece1.is_obstructed?(0, 5)).to be false
    end 

    it 'should return true if horizontal_obstruction' do  
      #setup game board
      #When setting up spec remember the three A: Arrange, Act and Assert
      game1 = Game.create
      game1.fill_for_testing
      game1.print_board
      piece1 = Pawn.create(position_x: 1, position_y: 0, game_id: game1.id)
      result = expect(piece1.is_obstructed?(4, 0)).to be true
    end
  end
end