class ChessPiece < ApplicationRecord
  # note to self: we need to add associations see example below:
  belongs_to :game
  # belongs_to :user

  def check_path(position_x,position_y,end_x,end_y)
    return 'horizontal' if position_y == end_y
    return 'vertical' if position_x == end_x
    delta_x = (end_x - position_x).abs
    delta_y = (end_y - position_y).abs
    return 'diagonal' if (delta_y/delta_x) == 1.0
    if not ['horizontal','vertical','diagonal'] then
      return invalid_move
    end
    false
  end

  def invalid_move
    raise "Invalid Move"
  end

  def space_occupied?(x, y)
    game.chess_pieces.each do |piece|
      return true if piece.position_x == x && piece.position_y == y
    end

    return false
  end

  def is_obstructed?(end_x,end_y)
    path = check_path(position_x, position_y, end_x, end_y)

    # if not ['horizontal','vertical','diagonal'].include? path then
    #   raise "Invalid Move"
    # end

    if path == 'horizontal' && position_x < end_x
      (position_x + 1).upto(end_x - 1) do |x|
        y = position_y
        return true if space_occupied?(x,y)
      end
    end

    if path == 'horizontal' && position_x > end_x
      (position_x - 1).downto(end_x + 1) do |x|
        y = position_y
        return true if space_occupied?(x,y)
      end
    end

    if path == 'vertical' && position_y < end_y
      (position_y + 1).upto(end_y - 1) do |y|
        x = position_x
        return true if space_occupied?(x,y)
      end
    end

    if path == 'vertical' && position_y > end_y
      (position_y - 1).downto(end_y + 1) do |y|
        x = position_x
        return true if space_occupied?(x,y)
      end
    end
    
    if path == 'diagonal' && end_x > position_x # end greater than
      (position_x + 1).upto(end_x - 1) do |x|
        # delta_y = position_x - x
        # y = end_y > position_y ? position_y + delta_y : position_y - delta_y
        if end_y > position_y
          (position_y + 1).upto(end_y - 1) do |y|
            return true if space_occupied?(x,y)
          end
        end
        if end_y < position_y
          (position_y - 1).upto(end_y + 1) do |y|
            return true if space_occupied?(x,y)
          end
        end
      end
    end

    if path == 'diagonal' && end_x < position_x # end less than
      (position_x - 1).downto(end_x + 1) do |x|
        if end_y > position_y
          (position_y + 1).upto(end_y - 1) do |y|
            return true if space_occupied?(x,y)
          end
        end
        if end_y < position_y
          (position_y - 1).upto(end_y + 1) do |y|
            return true if space_occupied?(x,y)
          end
        end
      end
    end

    false
  end  
  

  def get_piece_type
    types = [
      :white_rook,
      :white_knight,
      :white_bishop,
      :white_queen,
      :white_king,
      :white_pawn,
      :black_rook,
      :black_knight,
      :black_bishop,
      :black_queen,
      :black_king,
      :black_pawn,
    ]
    n = self.type
    c = self.color
    n = "#{c.downcase}_#{n.downcase}"
    pid = types.index(n.to_sym)
    return pid
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