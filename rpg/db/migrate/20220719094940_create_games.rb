class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.integer :begin_level, default: 1
      t.integer :exp_point, default: 50
      t.float :exp_coef, default: 1
      t.references :gm, null: false, foreign_key: { to_tables: 'gms'}
      t.references :channel, null: false, foreign_key: { to_tables: 'channels'}
      t.references :player, null: true, foreign_key: { to_tables: 'players'}
      t.references :chapter, null: true, foreign_key: { to_tables: 'chapters'}

      t.timestamps
    end
  end
end
