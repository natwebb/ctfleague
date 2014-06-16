class AddDraftIdToTokens < ActiveRecord::Migration
  def change
    add_column :tokens, :draft_id, :integer
  end
end
