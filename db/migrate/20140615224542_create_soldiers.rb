class CreateSoldiers < ActiveRecord::Migration
  def change
    create_table :soldiers do |t|
      t.integer :aim
      t.integer :stealth
      t.integer :sight
      t.integer :speed
      t.integer :hardiness
      t.integer :leadership
      t.integer :xp
      t.integer :age
      t.integer :damage
      t.integer :rank
      t.string :first_name
      t.string :last_name
      t.boolean :active

      t.timestamps
    end
  end
end
