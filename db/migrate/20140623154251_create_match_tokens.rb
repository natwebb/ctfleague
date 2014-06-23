class CreateMatchTokens < ActiveRecord::Migration
  def change
    create_table :match_tokens do |t|
      t.integer :match_id
      t.integer :team_id
    end
  end
end
