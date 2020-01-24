class ChessPiecesController < ApplicationController

  def show
    #get pieces id

  end

  def update
    @piece  = ChessPiece.find(params[:id])
    @game = Game.includes(:chess_pieces).find @piece.game.id
    if @piece then
      pos = [params[:ex],params[:ey]]
      @piece.update_attributes({position_x: pos[0], position_y: pos[1]})
      render :json => { ok: true } and return
    end
    render :json => {ok: false} and return
  end

end
