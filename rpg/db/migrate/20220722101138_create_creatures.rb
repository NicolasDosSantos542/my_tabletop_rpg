class CreateCreatures < ActiveRecord::Migration[7.0]
  def change
    create_table :creatures do |t|
      t.integer :loot_id
      t.integer :strength
      t.integer :life
      t.text  :image
      t.integer :given_exp
      t.text :description
      t.text :name


      t.timestamps
    end
  end
end
