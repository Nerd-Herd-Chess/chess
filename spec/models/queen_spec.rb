require 'rails_helper'

RSpec.describe Queen, type: :model do 
  describe 'valid_move?' do
    it 'returns true if move is valid' do
      queen = Queen.create(position_x: 3, position_y: 0, color: "black") #This is a new piece with start x (aka current position of piece in x coordinate) as 3 and start y as o
      expect(queen.valid_move?(4, 1)).to be(true) #The arguments 3,1 are the end x (where x moves to) and end y (where y moves to) positions being tested see image in TRello
      expect(queen.valid_move?(2, 1)).to be(true) #The arguments 2,1 are the end x and end y positions being tested see image in TRello
      #expect(queen.valid_move?(4, 1)).to be(true) #Is this correct?
      expect(queen.valid_move?(0, 3)).to be(true) #The arguments 0,3 are the end x and end y positions being tested see image in TRello
    end

    it 'returns false if move is invalid' do
      queen = Queen.create(position_x: 3, position_y: 0, color: "black")
      expect(queen.valid_move?(4, 2)).to be(false)
      #expect(queen.valid_move?(1, 1)).to be(false) # is this correct? can she do this in one move?
    end
    
  end

end