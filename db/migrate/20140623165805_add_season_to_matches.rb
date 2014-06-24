class AddSeasonToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :season, :integer
  end
end
