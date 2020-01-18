class ChessPiecesController < ApplicationController

  def index


  end

  def show
    #get pieces id

  end



  def update

  end



  def destroy

  end



  private

  def pieces_params
    params.require(:piece_id, :color, :type, :position_x, :position_y)
  end



end
