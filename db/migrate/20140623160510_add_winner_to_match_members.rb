class AddWinnerToMatchMembers < ActiveRecord::Migration
  def change
    add_column :match_members, :winner, :boolean
  end
end
