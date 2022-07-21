class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :pnj
      t.text :message
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
