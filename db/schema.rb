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

ActiveRecord::Schema[7.0].define(version: 2022_06_03_221648) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "behaviors", force: :cascade do |t|
    t.string "description"
    t.bigint "competency_id", null: false
    t.bigint "level_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competency_id"], name: "index_behaviors_on_competency_id"
    t.index ["level_id"], name: "index_behaviors_on_level_id"
  end

  create_table "competencies", force: :cascade do |t|
    t.string "name"
    t.bigint "pillar_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pillar_id"], name: "index_competencies_on_pillar_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pillars", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quiz_guesses", force: :cascade do |t|
    t.bigint "behavior_id", null: false
    t.bigint "level_id", null: false
    t.bigint "competency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["behavior_id"], name: "index_quiz_guesses_on_behavior_id"
    t.index ["competency_id"], name: "index_quiz_guesses_on_competency_id"
    t.index ["level_id"], name: "index_quiz_guesses_on_level_id"
  end

  add_foreign_key "behaviors", "competencies"
  add_foreign_key "behaviors", "levels"
  add_foreign_key "competencies", "pillars"
  add_foreign_key "quiz_guesses", "behaviors"
  add_foreign_key "quiz_guesses", "competencies"
  add_foreign_key "quiz_guesses", "levels"
end
