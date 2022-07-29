class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :total_life, default: 10
      t.integer :life, default: 10
      t.integer :total_strength, default:10
      t.integer :strength, default:10
      t.integer :experience, default: 0
      t.integer :gold, default: 0
      t.string :avatar
      t.references :step, null: true, foreign_key: true
      t.references :chapter, null: true, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
