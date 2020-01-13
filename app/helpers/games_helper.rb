module GamesHelper

  def render_piece(color, type)
    return "<i class='piece-color-#{color} fas fa-chess-#{type.downcase}' style='color: #{color}'></i>".html_safe
  end
end
