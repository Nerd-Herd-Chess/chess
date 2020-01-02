require 'rails_helper'

def getDefaultGame
  return new Game()

end

RSpec.describe Game, type: :model do
  context "is_obstructed?" do
    it "returns false when A6 to C4" do
      #setup game board
      game = getDefaultGame
      result = game.is_obstructed?('A6', "C4")

      expect(result).to ew false

    end

    it "returns true when F1 to D4" do
      #Arragne
      #Act
      #Assert
    end

    it "returns true when A1 to A4" do

    end
  end
end


is_obstructed? A6 -> C4 => false
is_obstructed? F1 -> D3 => true
is_obstructed? A1 -> A4 => true