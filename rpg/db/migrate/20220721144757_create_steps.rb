class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.integer :order
      t.integer :creature_id
      t.integer :loot_id
      t.integer :chapter_id

      t.timestamps
    end
  end
end
