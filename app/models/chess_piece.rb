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
    if is_diagonal?(start_x, start_y, end_x, end_y) 
      if start_x < x_end
      #(start_x + 1).upto(end_x - 1) do |x|
        #delta_y = x - x_position
        #y = y_end > y_position ? y_position + delta_y : y_position - delta_y
        #return true if game.space_occupied?(x, y)
      #end
      # path is diagonal and up
      else 
      #(x_position - 1).downto(x_end + 1) do |x|
        #delta_y = x_position - x
        #y = y_end > y_position ? y_position + delta_y : y_position - delta_y
        #return true if game.space_occupied?(x, y)
      #end
      end   
    end

    false
  end

end
