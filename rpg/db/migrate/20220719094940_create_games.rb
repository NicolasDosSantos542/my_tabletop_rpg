class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.references :channel, null: false, foreign_key: { to_tables: 'channels'}

      t.timestamps
    end
  end
end
