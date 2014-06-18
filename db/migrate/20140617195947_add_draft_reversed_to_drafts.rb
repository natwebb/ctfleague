class AddDraftReversedToDrafts < ActiveRecord::Migration
  def change
    add_column :drafts, :draft_reversed, :boolean
  end
end
