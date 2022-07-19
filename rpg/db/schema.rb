# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_19_125212) do
  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.integer "next"
    t.integer "choice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_answers_on_choice_id"
  end

  create_table "choices", force: :cascade do |t|
    t.text "description"
    t.integer "step_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "index_choices_on_step_id"
  end

  create_table "creatures", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer "choice_id", null: false
    t.integer "creature_id", null: false
    t.integer "next"
    t.integer "previous"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_steps_on_choice_id"
    t.index ["creature_id"], name: "index_steps_on_creature_id"
  end

  add_foreign_key "answers", "choices"
  add_foreign_key "choices", "steps"
  add_foreign_key "steps", "choices"
  add_foreign_key "steps", "creatures"
end
