class AddTokenIdToMatchTokens < ActiveRecord::Migration
  def change
    add_column :match_tokens, :token_id, :integer
  end
end
