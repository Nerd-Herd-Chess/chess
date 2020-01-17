require 'rails_helper'


RSpec.describe Rook, type: :model do #(Creatated automatically when model was created)
  describe 'valid_move?' do
    it 'returns true if move is valid' do
      rook = Rook.create(position_x: 0, position_y: 0, color: "white")
      expect(rook.valid_move?(0, 1)).to be(true)
      expect(rook.valid_move?(0, 7)).to be(true)
      expect(rook.valid_move?(0, 3)).to be(true)
      expect(rook.valid_move?(1, 0)).to be(true)
      expect(rook.valid_move?(3, 0)).to be(true)
      expect(rook.valid_move?(7, 0)).to be(true)
    end


    it 'returns false if move is invalid' do
      rook = Rook.create(position_x: 0, position_y: 0, color: "white")
      expect(rook.valid_move?(1, 1)).to be(false)
      expect(rook.valid_move?(7, 7)).to be(false)
      expect(rook.valid_move?(3, 3)).to be(false)
      expect(rook.valid_move?(4, 4)).to be(false)
    end
    




  end


end