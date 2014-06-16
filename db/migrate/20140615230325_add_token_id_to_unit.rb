class AddTokenIdToUnit < ActiveRecord::Migration
  def change
    add_column :units, :token_id, :integer
  end
end
