class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.references :choice, null: false, foreign_key: true
      t.references :creature, null: false, foreign_key: true
      t.integer :next
      t.integer :previous, null: true

      t.timestamps
    end
  end
end
