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

ActiveRecord::Schema[7.0].define(version: 2022_07_27_191805) do
  create_table "answers", force: :cascade do |t|
    t.text "description"
    t.integer "choice_id", null: false
    t.integer "next"
    t.integer "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_answers_on_choice_id"
  end

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "equipment_life", default: 0
    t.integer "total_life", default: 10
    t.integer "life", default: 10
    t.integer "total_strength", default: 10
    t.integer "strength", default: 10
    t.integer "experience", default: 0
    t.integer "level", default: 1
    t.integer "gold", default: 0
    t.string "avatar"
    t.integer "step_id"
    t.integer "chapter_id"
    t.integer "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_characters_on_chapter_id"
    t.index ["game_id"], name: "index_characters_on_game_id"
    t.index ["step_id"], name: "index_characters_on_step_id"
  end

  create_table "choices", force: :cascade do |t|
    t.text "description"
    t.integer "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "creatures", force: :cascade do |t|
    t.integer "loot_id"
    t.integer "strength"
    t.integer "life"
    t.text "image"
    t.integer "given_exp"
    t.text "description"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_players", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "game_id", null: false
    t.integer "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_game_players_on_character_id"
    t.index ["game_id"], name: "index_game_players_on_game_id"
    t.index ["player_id"], name: "index_game_players_on_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "begin_level", default: 1
    t.integer "exp_point", default: 50
    t.float "exp_coef", default: 1.0
    t.integer "gm_id", null: false
    t.integer "channel_id", null: false
    t.integer "player_id"
    t.integer "chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_games_on_channel_id"
    t.index ["chapter_id"], name: "index_games_on_chapter_id"
    t.index ["gm_id"], name: "index_games_on_gm_id"
    t.index ["player_id"], name: "index_games_on_player_id"
  end

  create_table "gms", force: :cascade do |t|
    t.string "login"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "path"
    t.string "name"
    t.string "image_type"
    t.string "loot_material"
    t.string "loot_type"
    t.integer "loot_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "loot_id", null: false
    t.integer "player_id", null: false
    t.integer "character_id", null: false
    t.integer "game_id", null: false
    t.boolean "wear"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_inventories_on_character_id"
    t.index ["game_id"], name: "index_inventories_on_game_id"
    t.index ["loot_id"], name: "index_inventories_on_loot_id"
    t.index ["player_id"], name: "index_inventories_on_player_id"
  end

  create_table "loots", force: :cascade do |t|
    t.integer "life"
    t.integer "strength"
    t.integer "exp"
    t.string "image"
    t.string "name"
    t.string "loot_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "pnj"
    t.text "message"
    t.integer "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_messages_on_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "login"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer "step_order"
    t.integer "creature_id"
    t.integer "loot_id"
    t.integer "chapter_id"
    t.integer "fight_next_step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "choices"
  add_foreign_key "characters", "chapters"
  add_foreign_key "characters", "games"
  add_foreign_key "characters", "steps"
  add_foreign_key "game_players", "characters"
  add_foreign_key "game_players", "games"
  add_foreign_key "game_players", "players"
  add_foreign_key "games", "channels"
  add_foreign_key "games", "chapters"
  add_foreign_key "games", "gms"
  add_foreign_key "games", "players"
  add_foreign_key "inventories", "characters"
  add_foreign_key "inventories", "games"
  add_foreign_key "inventories", "loots"
  add_foreign_key "inventories", "players"
  add_foreign_key "messages", "games"
end
