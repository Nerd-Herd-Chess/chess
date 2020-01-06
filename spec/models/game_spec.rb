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
  end
end


#is_obstructed? A6 -> C4 => false
#is_obstructed? F1 -> D3 => true
#is_obstructed? A1 -> A4 => true