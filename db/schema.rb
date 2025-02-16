# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151122145735) do

  create_table "answers", force: :cascade do |t|
    t.string   "jp_word"
    t.integer  "word_id"
    t.boolean  "is_correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "answers", ["word_id"], name: "index_answers_on_word_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.boolean  "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friends", ["friend_id"], name: "index_friends_on_friend_id"

  create_table "goals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.float    "average_score"
    t.float    "current_average_score"
    t.integer  "test_done"
    t.integer  "current_test_done"
    t.integer  "test_cancelled"
    t.datetime "started_at"
    t.datetime "deadline"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "introductions", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "study_logs", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "content"
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "mark"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tests", ["category_id"], name: "index_tests_on_category_id"
  add_index "tests", ["user_id"], name: "index_tests_on_user_id"

  create_table "user_answers", force: :cascade do |t|
    t.integer  "test_id"
    t.integer  "word_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_answers", ["answer_id"], name: "index_user_answers_on_answer_id"
  add_index "user_answers", ["test_id"], name: "index_user_answers_on_test_id"
  add_index "user_answers", ["word_id"], name: "index_user_answers_on_word_id"

  create_table "user_logs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "log_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "gender"
    t.datetime "dateofbirth"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "words", force: :cascade do |t|
    t.string   "vn_word"
    t.string   "pronunciation"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "words", ["category_id"], name: "index_words_on_category_id"

end
