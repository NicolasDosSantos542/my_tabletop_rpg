class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.text :description
      t.integer :step

      t.timestamps
    end
  end
end
