class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    redirect_to game_path(@game)
  end

  def show
    # @game = Game.find(params[:id])
    get_sample_game
  end

  def get_sample_game
    @game = Game.new
    @game.chess_pieces.create(position_x = 0, postion_y = 0, type = "King", color = "black")
    @game.chess_pieces.create(position_x = 1, postion_y = 1, type = "Pawn", color = "black")
    @game.chess_pieces.create(position_x = 7, postion_y = 7, type = "Rook", color = "black")
    return @game
  end

  private

  def game_params
    params.require(:game).permit(:player1_id, :player2_id)
  end
 
end
