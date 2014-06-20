class CreateAvailableTokens < ActiveRecord::Migration
  def change
    create_table :available_tokens do |t|
      t.integer :draft_id
      t.integer :token_id

      t.timestamps
    end
  end
end
