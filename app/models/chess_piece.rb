class ChessPiece < ApplicationRecord
  # note to self: we need to add associations see example below:
  belongs_to :game
  # belongs_to :user

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
  def horizontal_obstruction?(start_x, start_y, end_x, end_y)
    # movement: left to right
    if is_horizontal?(start_y, end_y) && start_x < end_x
      (start_x + 1).upto(end_x - 1) do |x|
        return true if game.space_occupied?(x, start_y) #see game.rb model file
      end
    # movement: right to left
    elsif is_horizontal?(start_y, end_y) && start_x > end_x
      (start_x - 1).downto(end_x + 1) do |x|
        return true if game.space_occupied?(x, start_y)
      end
    end
    false #returns false if there is no obstruction
  end

  # Code to handle vertical obstruction
  def vertical_obstruction?(end_x, end_y)
    # movement: up
    if is_vertical?(start_x, end_x) && start_y < y_end
      (start_y + 1).upto(end_y - 1) do |y|
        return true if game.space_occupied?(start_x, y)
      end
    # movement: down
    elsif is_vertical?(start_x, end_x) && start_y > end_y
      (y_position - 1).downto(y_end + 1) do |y|
        return true if game.space_occupied?(start_x, y)
      end
    end
    false
  end


  def diagonal_obstruction?(end_x, end_y) #Not sure how to complete diagonal obstruction
    # movement: diagonal and down
    if start_x != end_x && start_y != end_y && start_x < x_end
      #(start_x + 1).upto(end_x - 1) do |x|
        #delta_y = x - x_position
        #y = y_end > y_position ? y_position + delta_y : y_position - delta_y
        #return true if game.space_occupied?(x, y)
      #end
    # path is diagonal and up
    elsif start_x != end_x && start_y != end_y && start_x > end_x
      #(x_position - 1).downto(x_end + 1) do |x|
        #delta_y = x_position - x
        #y = y_end > y_position ? y_position + delta_y : y_position - delta_y
        #return true if game.space_occupied?(x, y)
      #end
    end
    false
  end
  
  def is_obstructed?(x, y)
    x_end = x
    y_end = y
    path = check_path(x_position, y_position, x_end, y_end)
    return horizontal_obstruction?(x_end, y_end) if path == 'horizontal'

    return vertical_obstruction(x_end, y_end) if path == 'vertical'

    return diagonal_obstruction(x_end, y_end) if path == 'diagonal'

    false

  end



  def can_be_blocked?(color)
    checked_king = game.find_king(color)
    obstruction_array = obstructed_squares(checked_king.x_position, checked_king.y_position)
    opponents = game.opponents_pieces(!color)
    opponents.each do |opponent|
      next if opponent.piece_type == 'King'
      obstruction_array.each do |square|
        return true if opponent.valid_move?(square[0], square[1])
      end
    end
    false
  end



  def move_causes_check?(x, y)
    state = false
    ActiveRecord::Base.transaction do
      change_location(x,y)
      state = game.in_check?(color)
      raise ActiveRecord::Rollback
    end
    reload
    state
  end

end

