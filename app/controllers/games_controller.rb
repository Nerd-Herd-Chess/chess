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
    set_starting_postions
  end

  def show
    @game = Game.find(params[:id])
  end

  def set_starting_postions
    @game.chess_pieces.create(position_x: 0, position_y: 1, type: "Rook", color: "white")
    @game.chess_pieces.create(position_x: 1, position_y: 1, type: "Knight", color: "white")
    @game.chess_pieces.create(position_x: 2, position_y: 1, type: "Bishop", color: "white")
    @game.chess_pieces.create(position_x: 3, position_y: 1, type: "King", color: "white")
    @game.chess_pieces.create(position_x: 4, position_y: 1, type: "Queen", color: "white")
    @game.chess_pieces.create(position_x: 5, position_y: 1, type: "Bishop", color: "white")
    @game.chess_pieces.create(position_x: 6, position_y: 1, type: "Knight", color: "white")
    @game.chess_pieces.create(position_x: 7, position_y: 1, type: "Rook", color: "white")
    @game.chess_pieces.create(position_x: 0, position_y: 2, type: "Pawn", color: "white")
    @game.chess_pieces.create(position_x: 1, position_y: 2, type: "Pawn", color: "white")
    @game.chess_pieces.create(position_x: 2, position_y: 2, type: "Pawn", color: "white")
    @game.chess_pieces.create(position_x: 3, position_y: 2, type: "Pawn", color: "white")
    @game.chess_pieces.create(position_x: 4, position_y: 2, type: "Pawn", color: "white")
    @game.chess_pieces.create(position_x: 5, position_y: 2, type: "Pawn", color: "white")
    @game.chess_pieces.create(position_x: 6, position_y: 2, type: "Pawn", color: "white")
    @game.chess_pieces.create(position_x: 7, position_y: 2, type: "Pawn", color: "white")
    @game.chess_pieces.create(position_x: 0, position_y: 8, type: "Rook", color: "black")
    @game.chess_pieces.create(position_x: 1, position_y: 8, type: "Knight", color: "black")
    @game.chess_pieces.create(position_x: 2, position_y: 8, type: "Bishop", color: "black")
    @game.chess_pieces.create(position_x: 3, position_y: 8, type: "King", color: "black")
    @game.chess_pieces.create(position_x: 4, position_y: 8, type: "Queen", color: "black")
    @game.chess_pieces.create(position_x: 5, position_y: 8, type: "Bishop", color: "black")
    @game.chess_pieces.create(position_x: 6, position_y: 8, type: "Knight", color: "black")
    @game.chess_pieces.create(position_x: 7, position_y: 8, type: "Rook", color: "black")
    @game.chess_pieces.create(position_x: 0, position_y: 7, type: "Pawn", color: "black")
    @game.chess_pieces.create(position_x: 1, position_y: 7, type: "Pawn", color: "black")
    @game.chess_pieces.create(position_x: 2, position_y: 7, type: "Pawn", color: "black")
    @game.chess_pieces.create(position_x: 3, position_y: 7, type: "Pawn", color: "black")
    @game.chess_pieces.create(position_x: 4, position_y: 7, type: "Pawn", color: "black")
    @game.chess_pieces.create(position_x: 5, position_y: 7, type: "Pawn", color: "black")
    @game.chess_pieces.create(position_x: 6, position_y: 7, type: "Pawn", color: "black")
    @game.chess_pieces.create(position_x: 7, position_y: 7, type: "Pawn", color: "black")
    
    return @game
  end

  private

  def game_params
    params.require(:game).permit(:player1_id, :player2_id)
  end
 
end
