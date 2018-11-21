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

ActiveRecord::Schema.define(version: 2018_11_20_215420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendas", force: :cascade do |t|
    t.bigint "sensei_id"
    t.date "date"
    t.integer "time", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sensei_id"], name: "index_agendas_on_sensei_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "session_token"
    t.string "generated_token"
    t.bigint "lesson_request_id"
    t.boolean "student_online"
    t.boolean "sensei_online"
    t.integer "rating"
    t.index ["lesson_request_id"], name: "index_chat_rooms_on_lesson_request_id"
  end

  create_table "lesson_requests", force: :cascade do |t|
    t.bigint "sensei_id"
    t.bigint "user_id"
    t.bigint "subject_id"
    t.text "description"
    t.boolean "sensei_accepted"
    t.text "denial_reason"
    t.date "lesson_date"
    t.integer "time"
    t.float "amount"
    t.string "payment_state"
    t.jsonb "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration"
    t.integer "rating"
    t.index ["sensei_id"], name: "index_lesson_requests_on_sensei_id"
    t.index ["subject_id"], name: "index_lesson_requests_on_subject_id"
    t.index ["user_id"], name: "index_lesson_requests_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "sensei_subjects", force: :cascade do |t|
    t.bigint "sensei_id"
    t.bigint "subject_id"
    t.float "price_per_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sensei_id"], name: "index_sensei_subjects_on_sensei_id"
    t.index ["subject_id"], name: "index_sensei_subjects_on_subject_id"
  end

  create_table "senseis", force: :cascade do |t|
    t.bigint "user_id"
    t.float "avg_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_senseis_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_subjects_on_parent_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "username"
    t.string "photo"
    t.text "description"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "agendas", "senseis"
  add_foreign_key "chat_rooms", "lesson_requests"
  add_foreign_key "lesson_requests", "senseis"
  add_foreign_key "lesson_requests", "subjects"
  add_foreign_key "lesson_requests", "users"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "sensei_subjects", "senseis"
  add_foreign_key "sensei_subjects", "subjects"
  add_foreign_key "senseis", "users"
end
