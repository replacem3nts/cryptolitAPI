# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_07_004335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "puzzle_id", null: false
    t.boolean "solved", default: false
    t.integer "solvetime", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "cryptogram"
    t.string "solvekey"
    t.index ["puzzle_id"], name: "index_challenges_on_puzzle_id"
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.text "content"
    t.string "author"
    t.string "source"
    t.integer "difficulty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "challenges", "puzzles"
  add_foreign_key "challenges", "users"
end
