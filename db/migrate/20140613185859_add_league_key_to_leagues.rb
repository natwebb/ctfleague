class AddLeagueKeyToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :league_key, :string
  end
end
