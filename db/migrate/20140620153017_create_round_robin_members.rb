class CreateRoundRobinMembers < ActiveRecord::Migration
  def change
    create_table :round_robin_members do |t|
      t.integer :user_id
      t.integer :round_robin_id
      t.integer :position

      t.timestamps
    end
  end
end
