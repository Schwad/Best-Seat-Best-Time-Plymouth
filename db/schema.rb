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

ActiveRecord::Schema.define(version: 20150915114235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "datapoints", force: :cascade do |t|
    t.integer  "room_id"
    t.float    "free"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "room_name"
    t.integer  "total_rooms"
    t.integer  "total_available"
  end

  create_table "days", force: :cascade do |t|
    t.text     "room_name"
    t.integer  "hour_0"
    t.integer  "hour_1"
    t.integer  "hour_2"
    t.integer  "hour_3"
    t.integer  "hour_4"
    t.integer  "hour_5"
    t.integer  "hour_6"
    t.integer  "hour_7"
    t.integer  "hour_8"
    t.integer  "hour_9"
    t.integer  "hour_10"
    t.integer  "hour_11"
    t.integer  "hour_12"
    t.integer  "hour_13"
    t.integer  "hour_14"
    t.integer  "hour_15"
    t.integer  "hour_16"
    t.integer  "hour_17"
    t.integer  "hour_18"
    t.integer  "hour_19"
    t.integer  "hour_20"
    t.integer  "hour_21"
    t.integer  "hour_22"
    t.integer  "hour_23"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "full_data"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
