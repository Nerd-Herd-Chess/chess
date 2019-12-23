class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :game_id
      t.integer :player1_id
      t.string :player1_color
      t.integer :player2_id
      t.string :player2_color
      t.integer :winning_user
      t.timestamps
    end
  end
end
