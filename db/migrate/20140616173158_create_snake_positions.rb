class CreateSnakePositions < ActiveRecord::Migration
  def change
    create_table :snake_positions do |t|
      t.integer :user_id
      t.integer :draft_id
      t.integer :position
    end
  end
end
