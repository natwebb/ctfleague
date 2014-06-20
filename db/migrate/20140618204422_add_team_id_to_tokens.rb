class AddTeamIdToTokens < ActiveRecord::Migration
  def change
    add_column :tokens, :team_id, :integer
  end
end
