class Game < ApplicationRecord
  has_many :chess_pieces

  def space_occupied?(x, y)
    chess_pieces.each do |piece|
      return true if piece.position_x == x && piece.position_y == y
    end

    return false
  end

  #checking path
  def is_horizontal?(start_y, end_y)
    return (start_y==end_y) 
  end

  def is_vertical?(start_x, end_x)
    return (start_x==end_x) 
  end

  def is_diagonal?(start_x, start_y, end_x, end_y)
    return (start_x != end_x && start_y != end_y)
  end

  # Code to handle horizontal obstruction
  def horizontal_obstruction?(start_x,start_y,end_x,end_y)
    # movement: left to right
    if is_horizontal?(start_y, end_y) && start_x < end_x
      (start_x + 1).upto(end_x - 1) do |x|
        y = start_y
        return true if @game.space_occupied?(x, y) #see game.rb model file
      end
    # movement: right to left
    elsif is_horizontal?(start_y, end_y) && start_x > end_x
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
    if is_vertical?(start_x, end_x) && start_y < end_y
      (start_y + 1).upto(end_y - 1) do |y|
        x = start_x
        return true if @game.space_occupied?(x, y)
      end
    # movement: down
    elsif is_vertical?(start_x, end_x) && start_y > end_y
      (start_y - 1).downto(end_y + 1) do |y|
        x = start_x
        return true if @game.space_occupied?(x, y)
      end
    end
    false
  end


  def diagonal_obstruction?(start_x,start_y,end_x,end_y) #Not sure how to complete diagonal obstruction
    if end_x > start_x and end_y > start_y then
      # we are in QI
      (start_y..end_y).each do |y|
        (start_x..end_x).each do |x|
          return true if game.space_occupied?(x,y)
        end
      end
    elsif end_x < start_x and end_y > start_y then
      # QII
      (start_y..end_y) 
        (end_x..start_x)
    elsif end_x < start_x and end_y < start_y then
      # QII
    else
      # Q4, end_x > start_x and end_y < start_y

    end
  end

  def check_path(start_x,start_y,end_x,end_y)
    return 'horizontal' if start_y == end_y
    return 'vertical' if start_x == end_x
    dx = start_x - end_x
    dy = start_y - end_y
    return 'diagonal' if dx.abs == dy.abs
    return 'invalid'
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

  def invalid_move
    raise StandardError.new "Invalid Move"
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
