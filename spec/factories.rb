FactoryBot.define do
  factory :game do
  end
  factory :full_game do
    g = Game.create
    # put stuff here
    g.fill_for_testing
    g
  end
  factory :chess_piece do
  end
end