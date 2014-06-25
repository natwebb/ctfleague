class AddRetiredToSoldiers < ActiveRecord::Migration
  def change
    add_column :soldiers, :retired, :boolean
  end
end
