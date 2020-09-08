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

ActiveRecord::Schema.define(version: 4) do

  create_table "game_questions", force: :cascade do |t|
    t.integer "game_id"
    t.integer "question_id"
    t.boolean "correct"
  end

  create_table "games", force: :cascade do |t|
    t.integer "user_id"
    t.string "difficulty"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.string "difficulty"
    t.string "correct"
    t.string "wrong_one"
    t.string "wrong_two"
    t.string "wrong_three"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
  end

end
