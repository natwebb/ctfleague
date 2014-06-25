class AddReadyToMatchMember < ActiveRecord::Migration
  def change
    add_column :match_members, :ready, :boolean
  end
end
