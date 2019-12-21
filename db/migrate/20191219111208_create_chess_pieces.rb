class CreateChessPieces < ActiveRecord::Migration[5.2]
  def change
    create_table :chess_pieces do |t|
      t.integer :piece_id
      t.integer :game_id 
      t.string :color 
      t.string :type 
      t.integer :position_x
      t.integer :position_y
      t.timestamps
    end
  end
end
