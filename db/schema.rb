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

ActiveRecord::Schema.define(version: 20160507232835) do

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

  create_table "seasons", force: :cascade do |t|
    t.integer  "season_number"
    t.string   "desription"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "series_id"
    t.date     "premiere"
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
  end

  add_index "series", ["genre_id"], name: "index_series_on_genre_id"

end
