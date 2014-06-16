class AddUnitIdToSoldiers < ActiveRecord::Migration
  def change
    add_column :soldiers, :unit_id, :integer
  end
end
