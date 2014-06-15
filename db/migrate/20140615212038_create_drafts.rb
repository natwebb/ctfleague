class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.integer :league_id

      t.timestamps
    end
  end
end
