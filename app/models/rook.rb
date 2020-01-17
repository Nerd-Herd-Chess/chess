class Rook < ChessPiece 
  def valid_move?(end_x, end_y)
    delta_x = (position_x - end_x).abs
    delta_y = (position_y - end_y).abs
    delta_x == 0 || delta_y == 0
    
  end
end