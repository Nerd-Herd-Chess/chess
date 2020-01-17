class Knight < ChessPiece 
  def valid_move?(end_x, end_y)
    # max movement in 1 way is 2 and other axis move is 1
    delta_x = (position_x - end_x).abs
    delta_y = (position_y - end_y).abs
    delta_x * delta_y == 2
  end
end