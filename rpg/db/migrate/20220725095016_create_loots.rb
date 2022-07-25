class CreateLoots < ActiveRecord::Migration[7.0]
  def change
    create_table :loots do |t|
      t.integer :life
      t.integer :strength
      t.integer :exp
      t.string :image

      t.timestamps
    end
  end
end
