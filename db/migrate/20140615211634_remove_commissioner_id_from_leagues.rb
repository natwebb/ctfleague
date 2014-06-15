class RemoveCommissionerIdFromLeagues < ActiveRecord::Migration
  def change
    remove_column :leagues, :commissioner_id, :integer
  end
end
