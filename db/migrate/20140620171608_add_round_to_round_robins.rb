class AddRoundToRoundRobins < ActiveRecord::Migration
  def change
    add_column :round_robins, :round, :integer
  end
end
