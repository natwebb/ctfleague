class RemovePositionFromRoundRobin < ActiveRecord::Migration
  def change
    remove_column :round_robins, :position, :integer
  end
end
