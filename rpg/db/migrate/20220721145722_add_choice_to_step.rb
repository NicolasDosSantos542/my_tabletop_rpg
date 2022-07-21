class AddChoiceToStep < ActiveRecord::Migration[7.0]
  def change
    add_reference :steps, :step, null: false, foreign_key: true
  end
end
