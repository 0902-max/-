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

ActiveRecord::Schema[7.0].define(version: 2023_12_07_060257) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "document_id"
    t.text "question"
    t.string "user_choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_choices_on_document_id"
    t.index ["user_id"], name: "index_choices_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "google_calendar_events", force: :cascade do |t|
    t.bigint "user_id"
    t.string "google_event_id"
    t.string "title"
    t.text "description"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_google_calendar_events_on_user_id"
  end

  create_table "grants", force: :cascade do |t|
    t.string "subsidy_name"
    t.text "purpose"
    t.string "industry"
    t.integer "employees_count"
    t.string "target_region"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "summary"
    t.string "catch_phrase"
    t.integer "max_grant_amount"
    t.text "target_region_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learning_roadmaps", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.bigint "google_calendar_event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["google_calendar_event_id"], name: "index_learning_roadmaps_on_google_calendar_event_id"
    t.index ["user_id"], name: "index_learning_roadmaps_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "google_calendar_event_id"
    t.string "message"
    t.datetime "notified_at"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["google_calendar_event_id"], name: "index_notifications_on_google_calendar_event_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "past_questions", force: :cascade do |t|
    t.text "question_text"
    t.string "option_a"
    t.string "option_b"
    t.string "option_c"
    t.string "option_d"
    t.string "option_e"
    t.string "correct_option"
    t.text "explanation"
    t.integer "exam_year"
    t.string "exam_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_past_question_attempts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "past_question_id"
    t.string "selected_option"
    t.boolean "is_correct"
    t.datetime "answered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["past_question_id"], name: "index_user_past_question_attempts_on_past_question_id"
    t.index ["user_id"], name: "index_user_past_question_attempts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "score"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vocabulary_entries", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "vocabulary_note_id"
    t.string "word"
    t.string "meaning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vocabulary_entries_on_user_id"
    t.index ["vocabulary_note_id"], name: "index_vocabulary_entries_on_vocabulary_note_id"
  end

  create_table "vocabulary_notes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vocabulary_notes_on_user_id"
  end

  add_foreign_key "choices", "documents"
  add_foreign_key "choices", "users"
  add_foreign_key "documents", "users"
  add_foreign_key "google_calendar_events", "users"
  add_foreign_key "learning_roadmaps", "google_calendar_events"
  add_foreign_key "learning_roadmaps", "users"
  add_foreign_key "notifications", "google_calendar_events"
  add_foreign_key "notifications", "users"
  add_foreign_key "user_past_question_attempts", "past_questions"
  add_foreign_key "user_past_question_attempts", "users"
  add_foreign_key "vocabulary_entries", "users"
  add_foreign_key "vocabulary_entries", "vocabulary_notes"
  add_foreign_key "vocabulary_notes", "users"
end
