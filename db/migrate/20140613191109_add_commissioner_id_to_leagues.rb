class AddCommissionerIdToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :commissioner_id, :string
  end
end
