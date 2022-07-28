class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.integer :step_order
      t.integer :creature_id
      t.integer :loot_id
      t.integer :chapter_id
      t.integer :fight_next_step


      t.timestamps
    end
  end
end
