class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :league_id

      t.timestamps
    end
  end
end
