class Bishop < ChessPiece 
    def valid_move?(end_x, end_y)
        delta_x = (position_x - end_x).abs
        delta_y = (position_y - end_y).abs
        
        delta_y / delta_x == 1
      end
    
    
    end
end