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

ActiveRecord::Schema.define(version: 20160817214446) do

  create_table "episodes", force: :cascade do |t|
    t.string   "title"
    t.string   "episode_number"
    t.string   "description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "season_id"
    t.integer  "series_id"
    t.integer  "season_episode_number"
    t.date     "air_date"
  end

  add_index "episodes", ["season_id"], name: "index_episodes_on_season_id"
  add_index "episodes", ["series_id"], name: "index_episodes_on_series_id"

  create_table "genres", force: :cascade do |t|
    t.string   "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "series_id"
  end

  add_index "lists", ["series_id"], name: "index_lists_on_series_id"
  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "seasons", force: :cascade do |t|
    t.integer  "season_number"
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "series_id"
    t.date     "premiere"
    t.string   "url"
  end

  add_index "seasons", ["series_id"], name: "index_seasons_on_series_id"

  create_table "series", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.string   "network"
    t.date     "premiere"
    t.string   "cast"
    t.string   "creator"
    t.integer  "genre_id"
    t.string   "url"
    t.integer  "seasonsno"
    t.string   "poster"
  end

  add_index "series", ["genre_id"], name: "index_series_on_genre_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
