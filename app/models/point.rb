class Point
  attr_accessor(:x, :y)

  def initialize(x, y) 
    @x = x
    @y = y
  end

  def to_location() #A1 
    x_axis = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']
    return x_axis[@x] + (@y + 1).to_s
  end

  def self.from_location(location)  
    x = 0
    y = 0

    if (location[0] == 'A') 
      x = 0
    elsif (location[0] == 'B') 
      x = 1
    elsif (location[0] == 'C') 
      x = 2
    elsif (location[0] == 'D') 
      x = 3
    elsif (location[0] == 'E') 
      x = 4
    elsif (location[0] == 'F') 
      x = 5  
    elsif (location[0] == 'G') 
      x = 6
    elsif (location[0] == 'H') 
      x = 7
    end

    y = location[1].to_i - 1

    return Point.new(x, y)

  end

end