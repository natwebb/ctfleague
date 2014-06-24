class AddSeasonToDrafts < ActiveRecord::Migration
  def change
    add_column :drafts, :season, :integer
  end
end
