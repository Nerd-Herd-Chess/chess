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
    @piece,@position = nil,nil
    if params[:chosen_piece] then
      session[:chosen_piece] = params[:chosen_piece]
    end
    @piece = session[:chosen_piece]

      @piece = @game.chess_pieces.find(@piece) if @piece
    if params[:move] then
      @position = params[:move].split(',')
      
      @piece.update_attributes({position_x: @position[0], position_y: @position[1]}) if @piece
    end 
  end

  def set_starting_postions
    8.times do |i| 
     @game.chess_pieces.create(position_x: i, position_y: 1, type: "Pawn", color: "white")
     @game.chess_pieces.create(position_x: i, position_y: 6, type: "Pawn", color: "black")
    end
    @game.chess_pieces.create(position_x: 0, position_y: 0, type: "Rook", color: "white")
    @game.chess_pieces.create(position_x: 1, position_y: 0, type: "Knight", color: "white")
    @game.chess_pieces.create(position_x: 2, position_y: 0, type: "Bishop", color: "white")
    @game.chess_pieces.create(position_x: 3, position_y: 0, type: "King", color: "white")
    @game.chess_pieces.create(position_x: 4, position_y: 0, type: "Queen", color: "white")
    @game.chess_pieces.create(position_x: 5, position_y: 0, type: "Bishop", color: "white")
    @game.chess_pieces.create(position_x: 6, position_y: 0, type: "Knight", color: "white")
    @game.chess_pieces.create(position_x: 7, position_y: 0, type: "Rook", color: "white")
    @game.chess_pieces.create(position_x: 0, position_y: 7, type: "Rook", color: "black")
    @game.chess_pieces.create(position_x: 1, position_y: 7, type: "Knight", color: "black")
    @game.chess_pieces.create(position_x: 2, position_y: 7, type: "Bishop", color: "black")
    @game.chess_pieces.create(position_x: 3, position_y: 7, type: "King", color: "black")
    @game.chess_pieces.create(position_x: 4, position_y: 7, type: "Queen", color: "black")
    @game.chess_pieces.create(position_x: 5, position_y: 7, type: "Bishop", color: "black")
    @game.chess_pieces.create(position_x: 6, position_y: 7, type: "Knight", color: "black")
    @game.chess_pieces.create(position_x: 7, position_y: 7, type: "Rook", color: "black")
    return @game
  end

  private

  def game_params
    params.require(:game).permit(:player1_id, :player2_id)
  end
 
end
