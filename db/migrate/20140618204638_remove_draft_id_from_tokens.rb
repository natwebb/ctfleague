class RemoveDraftIdFromTokens < ActiveRecord::Migration
  def change
    remove_column :tokens, :draft_id, :integer
  end
end
