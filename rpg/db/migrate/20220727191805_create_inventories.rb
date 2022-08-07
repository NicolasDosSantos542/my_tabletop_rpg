class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :loot, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.boolean :wear

      t.timestamps
    end
  end
end
