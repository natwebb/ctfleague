class RemoveTeamIdFromMatchTokens < ActiveRecord::Migration
  def change
    remove_column :match_tokens, :team_id, :integer
  end
end
