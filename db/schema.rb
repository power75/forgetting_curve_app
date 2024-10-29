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

ActiveRecord::Schema[7.0].define(version: 2024_10_06_110216) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learning_histories", force: :cascade do |t|
    t.string "title", null: false
    t.text "content"
    t.string "image"
    t.integer "hour", null: false
    t.integer "count", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_learning_histories_on_user_id"
  end

  create_table "learning_history_tag_relations", force: :cascade do |t|
    t.bigint "learning_history_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learning_history_id", "tag_id"], name: "index_lh_tr", unique: true
    t.index ["learning_history_id"], name: "index_learning_history_tag_relations_on_learning_history_id"
    t.index ["tag_id"], name: "index_learning_history_tag_relations_on_tag_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "quiz_id", null: false
    t.string "title"
    t.datetime "notification_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_notifications_on_quiz_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.text "sample_answer"
    t.text "user_answer"
    t.bigint "learning_history_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["learning_history_id"], name: "index_quizzes_on_learning_history_id"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "learning_histories", "users"
  add_foreign_key "learning_history_tag_relations", "learning_histories"
  add_foreign_key "learning_history_tag_relations", "tags"
  add_foreign_key "notifications", "quizzes"
  add_foreign_key "notifications", "users"
  add_foreign_key "quizzes", "learning_histories"
  add_foreign_key "quizzes", "users"
end
