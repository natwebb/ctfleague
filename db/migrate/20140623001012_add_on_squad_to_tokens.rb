class AddOnSquadToTokens < ActiveRecord::Migration
  def change
    add_column :tokens, :on_squad, :boolean
  end
end
