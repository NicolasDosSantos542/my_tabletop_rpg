class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :description
      t.references :choice, null: false, foreign_key: true
      t.integer :next
      t.integer :exp

      t.timestamps
    end
  end
end
