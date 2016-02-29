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

ActiveRecord::Schema.define(version: 20160229050820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "tag"
  end

  create_table "interests", force: :cascade do |t|
    t.integer "category_id"
    t.integer "user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "review_title"
    t.text     "review_content"
    t.integer  "review_rating"
    t.integer  "teacher_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "url_key"
    t.integer  "classtime"
  end

  create_table "test", id: false, force: :cascade do |t|
    t.string "email", limit: 20
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.integer  "rating",      default: 0
    t.integer  "balance",     default: 0
    t.integer  "hourly_rate", default: 0
    t.text     "bio"
    t.boolean  "has_taught",  default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "email"
    t.boolean  "is_online",   default: false
    t.integer  "time_taught", default: 0
    t.string   "image"
  end

end
