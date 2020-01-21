class ChessPiecesController < ApplicationController

  def show
    #get pieces id
    @piece  = ChessPiece.find(params[:id])
    @game = Game.includes(:chess_pieces).find @piece.game.id
    if params[:move] then
      pos = params[:move].split(',')
      @piece.update_attributes({position_x: pos[0], position_y: pos[1]})
      redirect_to game_path(@game) and return
    end
  end

  def update
    piece = ChessPiece.find(params[:id])
  end

end
