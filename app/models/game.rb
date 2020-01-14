class Game < ApplicationRecord
  has_many :chess_pieces

  def space_occupied?(x, y)
    chess_pieces.each do |piece|
      return true if piece.position_x == x && piece.position_y == y
    end

    return false
  end

  # Code to handle horizontal obstruction
  def horizontal_obstruction?(start_x,start_y,end_x,end_y)
    # movement: left to right
    if start_y == end_y && start_x < end_x
      (start_x + 1).upto(end_x - 1) do |x|
        y = start_y
        return true if @game.space_occupied?(x, y) #see game.rb model file
      end
    # movement: right to left
    elsif start_y == end_y && start_x > end_x
      (start_x - 1).downto(end_x + 1) do |x|
        y = start_y
        return true if @game.space_occupied?(x, y)
      end
    end
    false #returns false if there is no obstruction
  end

  # Code to handle vertical obstruction
  def vertical_obstruction?(start_x, start_y, end_x, end_y)
    # movement: up
    if start_x == end_x && start_y < end_y
      (start_y + 1).upto(end_y - 1) do |y|
        x = start_x
        return true if space_occupied?(x, y)
      end
    # movement: down
    elsif start_x == end_x && start_y > end_y
      (start_y - 1).downto(end_y + 1) do |y|
        x = start_x
        return true if space_occupied?(x, y)
      end
    end
    false
  end


  def diagonal_obstruction?(start_x,start_y,end_x,end_y)
    slope = (end_y - start_y) / (end_x - start_x)
    if slope.abs == 1.0 && end_x > start_x
      (start_x + 1).downto(end_x - 1) do |x|
        delta_y = start_x - x
        y = end_y > start_y ? start_y + delta_y : start_y - delta_y
        return true if space_occupied?(x,y)
      end
    end
    if slope.abs == 1.0 && end_x < start_x
      (start_x + 1).upto(end_x - 1) do |x|
        delta_y = x - start_x
        y = end_y > start_y ? start_y + delta_y : start_y - delta_y
        return true if space_occupied?(x,y)
      end
    end
    false
  end

  def check_path(start_x,start_y,end_x,end_y)
    return 'horizontal' if start_y == end_y
    return 'vertical' if start_x == end_x
    slope = (end_y - start_y).to_f / (end_x - start_x).to_f
    return 'diagonal' if slope.abs == 1.0
    return false
  end

  def is_obstructed?(piece_loc, destination)
    start_x = piece_loc[0]
    start_y = piece_loc[1]
    end_x = destination[0]
    end_y = destination[1]
    path = check_path(start_x, start_y, end_x, end_x)
    return horizontal_obstruction?(start_x, start_y, end_x, end_y) if path == 'horizontal'

    return vertical_obstruction?(start_x, start_y, end_x, end_y) if path == 'vertical'

    return diagonal_obstruction?(start_x, start_y, end_x, end_y) if path == 'diagonal'

    false
  end

  def fill_for_testing
    chess_pieces.create(position_x: 0, position_y: 0, game_id: self.id)
    chess_pieces.create(position_x: 0, position_y: 7, game_id: self.id)
    chess_pieces.create(position_x: 7, position_y: 7, game_id: self.id)
    chess_pieces.create(position_x: 7, position_y: 0, game_id: self.id)
    chess_pieces.create(position_x: 1, position_y: 0, game_id: self.id)
    chess_pieces.create(position_x: 6, position_y: 0, game_id: self.id)
    chess_pieces.create(position_x: 3, position_y: 3, game_id: self.id)
    chess_pieces.create(position_x: 6, position_y: 7, game_id: self.id)
    chess_pieces.create(position_x: 6, position_y: 0, game_id: self.id)
    chess_pieces.create(position_x: 7, position_y: 5, game_id: self.id)
    chess_pieces.create(position_x: 0, position_y: 5, game_id: self.id)
    chess_pieces.create(position_x: 5, position_y: 7, game_id: self.id)
    chess_pieces.create(position_x: 3, position_y: 0, game_id: self.id)
    chess_pieces.create(position_x: 3, position_y: 7, game_id: self.id)
    chess_pieces.create(position_x: 4, position_y: 7, game_id: self.id)
    chess_pieces.create(position_x: 0, position_y: 1, game_id: self.id)
    chess_pieces.create(position_x: 1, position_y: 1, game_id: self.id)
    chess_pieces.create(position_x: 4, position_y: 1, game_id: self.id)
    chess_pieces.create(position_x: 5, position_y: 1, game_id: self.id)
    chess_pieces.create(position_x: 6, position_y: 1, game_id: self.id)
    chess_pieces.create(position_x: 7, position_y: 1, game_id: self.id)
    chess_pieces.create(position_x: 2, position_y: 3, game_id: self.id)
    chess_pieces.create(position_x: 1, position_y: 5, game_id: self.id)
    chess_pieces.create(position_x: 2, position_y: 6, game_id: self.id)
    chess_pieces.create(position_x: 3, position_y: 6, game_id: self.id)
    chess_pieces.create(position_x: 4, position_y: 6, game_id: self.id)
    chess_pieces.create(position_x: 5, position_y: 6, game_id: self.id)
    chess_pieces.create(position_x: 6, position_y: 6, game_id: self.id)
    chess_pieces.create(position_x: 7, position_y: 6, game_id: self.id)
  end
end
