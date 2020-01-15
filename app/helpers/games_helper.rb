module GamesHelper

  def render_piece(game, position_x, position_y)
    
    current_piece = @game.chess_pieces.find_by(position_x: position_x, position_y: position_y, game_id: game)
    if current_piece != nil
      color = current_piece["color"]
      type = current_piece["type"]
      return "<i class='piece-color-#{color} fas fa-chess-#{type.downcase}' style='color: #{color}'></i>".html_safe

    else 
      return " "
    end
    #piece_color = current_piece.color
    #type = current_piece.type
    
    # get the piece in the game at the x and y

    # if no piece found, return nill
    # else return color and type of piece
    #return "<i class='piece-color-#{color} fas fa-chess-#{type.downcase}' style='color: #{color}'></i>".html_safe
  end
end
