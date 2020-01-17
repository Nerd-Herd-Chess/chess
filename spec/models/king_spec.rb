require 'rails_helper'


RSpec.describe King, type: :model do #(Creatated automatically when model was created)
  describe 'valid_move?' do
    it 'returns true if move is valid' do
      king = King.create(position_x: 1, position_y: 1, color: "white")
      expect(king.valid_move?(2, 2)).to be(true)
    end

    it 'returns false if move is invalid' do
      king = King.create(position_x: 1, position_y: 1, color: "white")
      expect(king.valid_move?(3, 3)).to be(false)
    end
    




  end


end