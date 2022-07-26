class CreateGms < ActiveRecord::Migration[7.0]
  def change
    create_table :gms do |t|
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end
