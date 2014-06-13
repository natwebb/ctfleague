class AddInviteEmailsToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :invite_emails, :string
  end
end
