class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :path
      t.string :name
      t.string :image_type

      t.timestamps
    end
  end
end
