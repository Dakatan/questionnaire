# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180318061913) do

  create_table "answers", force: :cascade do |t|
    t.integer "respondent_id", null: false
    t.integer "question_id", null: false
    t.text "json_text", limit: 65535
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.boolean "active", default: true, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "questionnaire_id", null: false
    t.integer "no", null: false
    t.string "title", limit: 255, null: false
    t.string "question_type", limit: 255, null: false
    t.text "json_text", limit: 65535
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "respondents", force: :cascade do |t|
    t.integer "questionnaire_id", null: false
    t.string "name", limit: 50
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
