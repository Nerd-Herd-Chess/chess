require 'rails_helper'


RSpec.describe Knight, type: :model do #(Creatated automatically when model was created)
  describe 'valid_move?' do
    it 'returns true if move is valid' do
      knight = Knight.create(position_x: 4, position_y: 4, color: "white")
      expect(knight.valid_move?(5, 6)).to be(true)
      expect(knight.valid_move?(6, 5)).to be(true)
      expect(knight.valid_move?(6, 3)).to be(true)
      expect(knight.valid_move?(2, 3)).to be(true)
    end


    it 'returns false if move is invalid' do
      knight = Knight.create(position_x: 4, position_y: 4, color: "white")
      expect(knight.valid_move?(3, 3)).to be(false)
    end
    




  end


end