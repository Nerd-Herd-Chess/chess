require 'rails_helper'

RSpec.describe Queen, type: :model do 
  describe 'valid_move?' do
    it 'returns true when moving vertically' do
      queen = Queen.create(position_x: 3, position_y: 0, color: "black") #This is a new piece with start x (aka current position of piece in x coordinate) as 3 and start y as o
      expect(queen.valid_move?(3, 1)).to be(true) #The arguments 3,1 are the end x (where x moves to) and end y (where y moves to) positions being tested see image in TRello
    end

    it 'returns true when moving diagonally to right' do
      queen = Queen.create(position_x: 3, position_y: 0, color: "black") #This is a new piece with start x (aka current position of piece in x coordinate) as 3 and start y as o
      expect(queen.valid_move?(4, 1)).to be(true) 
    end

    it 'returns true when moving diagonally to left' do
      queen = Queen.create(position_x: 3, position_y: 0, color: "black") #This is a new piece with start x (aka current position of piece in x coordinate) as 3 and start y as o
      expect(queen.valid_move?(2, 1)).to be(true) 
      
    end

    it 'returns true when moving multiple spaces diagonally to left' do
      queen = Queen.create(position_x: 3, position_y: 0, color: "black") 
      expect(queen.valid_move?(0, 3)).to be(true) 
    end

    it 'returns true when moving vertically' do
      queen = Queen.create(position_x: 3, position_y: 0, color: "black") 
      expect(queen.valid_move?(3, 4)).to be(true) 
    end

    it 'returns true when moving diagonally right to left' do
      queen = Queen.create(position_x: 7, position_y: 4, color: "black") 
      expect(queen.valid_move?(1, 4)).to be(true) 
    end

    it 'returns true when moving diagonally left to right' do
      queen = Queen.create(position_x: 0, position_y: 3, color: "black") 
      expect(queen.valid_move?(6, 3)).to be(true) 
    end

    it 'returns true when moving vertically down' do
      queen = Queen.create(position_x: 3, position_y: 7, color: "black") 
      expect(queen.valid_move?(3, 2)).to be(true) 
    end

    it 'returns false if move is invalid' do
      queen = Queen.create(position_x: 3, position_y: 0, color: "black")
      expect(queen.valid_move?(4, 2)).to be(false)
      #expect(queen.valid_move?(1, 1)).to be(false) # is this correct? can she do this in one move?
    end
    
  end

end
