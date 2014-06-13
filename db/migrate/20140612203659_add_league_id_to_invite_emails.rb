class AddLeagueIdToInviteEmails < ActiveRecord::Migration
  def change
    add_column :invite_emails, :league_id, :integer
  end
end
