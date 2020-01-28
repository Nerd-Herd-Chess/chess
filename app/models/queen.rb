class Queen < ChessPiece 
  def valid_move?(end_x, end_y)
    delta_x = (position_x - end_x).abs # position_x same as start_x. abs means absolute value so when we get the difference answer will always be a positive value
    delta_y = (position_y - end_y).abs
    if delta_x==0
      return true 
    end  
    slope = (delta_y).to_i / (delta_x).to_i
    
    #delta_x < 9 && delta_y < 9 && ('diagonal' || 'horizontal' || 'vertical')
    delta_x < 9 && delta_y < 9 && (slope.abs == 1.0 || position_y == end_y || position_x == end_x)
  end
  
end
