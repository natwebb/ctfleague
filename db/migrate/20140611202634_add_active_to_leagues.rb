class AddActiveToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :active, :boolean
  end
end
