class CreateMatchMembers < ActiveRecord::Migration
  def change
    create_table :match_members do |t|
      t.integer :match_id
      t.integer :user_id

      t.timestamps
    end
  end
end
