class RemoveUserIdFromRoundRobin < ActiveRecord::Migration
  def change
    remove_column :round_robins, :user_id, :integer
  end
end
