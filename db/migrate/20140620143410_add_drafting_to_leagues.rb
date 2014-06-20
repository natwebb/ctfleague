class AddDraftingToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :drafting, :boolean
  end
end
