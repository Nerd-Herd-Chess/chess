class Game < ApplicationRecord
  has_many :chess_pieces

  def space_occupied?(x, y)
    chess_pieces.each do |piece|
      return true if piece.position_x == x && piece.position_y == y
    end

    return false
  end

  def set_for_testing
    8.times do |i| 
     chess_pieces.create(position_x: i, position_y: 1, type: "Pawn", color: "white")
     chess_pieces.create(position_x: i, position_y: 6, type: "Pawn", color: "black")
    end
     chess_pieces.create(position_x: 0, position_y: 0, type: "Rook", color: "white")
     chess_pieces.create(position_x: 1, position_y: 0, type: "Knight", color: "white")
     chess_pieces.create(position_x: 2, position_y: 0, type: "Bishop", color: "white")
     chess_pieces.create(position_x: 3, position_y: 0, type: "King", color: "white")
     chess_pieces.create(position_x: 4, position_y: 0, type: "Queen", color: "white")
     chess_pieces.create(position_x: 5, position_y: 0, type: "Bishop", color: "white")
     chess_pieces.create(position_x: 6, position_y: 0, type: "Knight", color: "white")
     chess_pieces.create(position_x: 7, position_y: 0, type: "Rook", color: "white")
     chess_pieces.create(position_x: 0, position_y: 7, type: "Rook", color: "black")
     chess_pieces.create(position_x: 1, position_y: 7, type: "Knight", color: "black")
     chess_pieces.create(position_x: 2, position_y: 7, type: "Bishop", color: "black")
     chess_pieces.create(position_x: 3, position_y: 7, type: "King", color: "black")
     chess_pieces.create(position_x: 4, position_y: 7, type: "Queen", color: "black")
     chess_pieces.create(position_x: 5, position_y: 7, type: "Bishop", color: "black")
     chess_pieces.create(position_x: 6, position_y: 7, type: "Knight", color: "black")
     chess_pieces.create(position_x: 7, position_y: 7, type: "Rook", color: "black")
  end

  def fill_for_testing
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 0, position_y: 0, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 0, position_y: 7, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 7, position_y: 7, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 7, position_y: 0, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 1, position_y: 0, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 6, position_y: 0, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 3, position_y: 3, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 6, position_y: 7, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 6, position_y: 0, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 7, position_y: 5, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 0, position_y: 5, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 5, position_y: 7, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 3, position_y: 0, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 3, position_y: 7, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 4, position_y: 7, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 0, position_y: 1, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 1, position_y: 1, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 4, position_y: 1, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 5, position_y: 1, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 6, position_y: 1, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 7, position_y: 1, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 2, position_y: 3, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 1, position_y: 5, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 2, position_y: 6, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 3, position_y: 6, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 4, position_y: 6, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 5, position_y: 6, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 6, position_y: 6, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 7, position_y: 6, game_id: self.id)
    chess_pieces.create(type: 'Pawn', color: 'white', position_x: 5, position_y: 0, game_id: self.id)
  end

  def get_board
    board = []
    8.times do 
      board.push [nil,nil,nil,nil,nil,nil,nil,nil]
    end
    chess_pieces.each do |p|
      y = p.position_y
      x = p.position_x
      board[y] = [] if board[y].nil?
      board[y][x] = p.get_piece_type
    end
    return board
  end
  def clear_all
    chess_pieces.each do |p| p.destroy end
  end
  def print_board
    b = get_board
    b = b.collect do |row|
      row.collect {|p| p.nil? ? "x" : p }.join "|"
    end
    puts b.join("\n")
  end
end