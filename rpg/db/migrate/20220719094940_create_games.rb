class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.references :gm, null: false, foreign_key: { to_tables: 'gms'}
      t.references :channel, null: false, foreign_key: { to_tables: 'channels'}
      t.references :player, null: true, foreign_key: { to_tables: 'players'}
      t.references :chapter, null: true, foreign_key: { to_tables: 'chapters'}

      t.timestamps
    end
  end
end
