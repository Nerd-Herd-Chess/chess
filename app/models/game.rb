class Game < ApplicationRecord
  has_many :chess_pieces

  def space_occupied?(x, y)
    chess_pieces.each do |piece|
      return true if piece.position_x == x && piece.position_y == y
    end

    return false
  end
end
