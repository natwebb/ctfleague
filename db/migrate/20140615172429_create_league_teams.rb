class CreateLeagueTeams < ActiveRecord::Migration
  def change
    create_table :league_teams do |t|

      t.timestamps
    end
  end
end
