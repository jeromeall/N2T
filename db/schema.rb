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

ActiveRecord::Schema.define(version: 20140207024112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "spots", force: true do |t|
    t.string   "name"
    t.text     "rating_img_url"
    t.text     "snippet_text"
    t.text     "image_url"
    t.string   "display_phone"
    t.text     "cross_streets"
    t.string   "city"
    t.string   "neighborhoods"
    t.integer  "postal_code"
    t.string   "state_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "yelp_id"
    t.text     "address"
    t.text     "note"
  end

  create_table "spotsusers", force: true do |t|
    t.integer  "user_id"
    t.integer  "spot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spotsusers", ["spot_id"], name: "index_spotsusers_on_spot_id", using: :btree
  add_index "spotsusers", ["user_id"], name: "index_spotsusers_on_user_id", using: :btree

  create_table "transitions", force: true do |t|
    t.integer  "user_id"
    t.integer  "spot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transitions", ["spot_id"], name: "index_transitions_on_spot_id", using: :btree
  add_index "transitions", ["user_id"], name: "index_transitions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.date     "birthday"
    t.text     "address"
    t.string   "city"
    t.string   "state_code"
    t.integer  "zip"
    t.string   "neighborhood"
    t.text     "about"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
