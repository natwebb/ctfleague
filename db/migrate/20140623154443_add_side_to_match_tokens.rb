class AddSideToMatchTokens < ActiveRecord::Migration
  def change
    add_column :match_tokens, :side, :integer
  end
end
