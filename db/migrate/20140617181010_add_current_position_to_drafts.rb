class AddCurrentPositionToDrafts < ActiveRecord::Migration
  def change
    add_column :drafts, :current_position, :integer
  end
end
