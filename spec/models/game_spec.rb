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

  describe 'populating a game' do  
    it 'should count 32 pieces' do
      game = Game.create
      game.set_for_testing
      expect(game.chess_pieces.count).to eq(32)
    end

    




  end
end