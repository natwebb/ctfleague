class AddPointsToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :points, :integer
  end
end
