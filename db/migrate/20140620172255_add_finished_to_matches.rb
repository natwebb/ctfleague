class AddFinishedToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :finished, :boolean
  end
end
