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

ActiveRecord::Schema.define(version: 20140623160510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "available_tokens", force: true do |t|
    t.integer  "draft_id"
    t.integer  "token_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drafts", force: true do |t|
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_position"
    t.boolean  "draft_reversed"
  end

  create_table "league_teams", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", force: true do |t|
    t.string  "name"
    t.boolean "active"
    t.integer "user_id"
    t.string  "league_key"
    t.boolean "drafting"
  end

  create_table "match_members", force: true do |t|
    t.integer  "match_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "winner"
  end

  create_table "match_tokens", force: true do |t|
    t.integer "match_id"
    t.integer "side"
    t.integer "token_id"
  end

  create_table "matches", force: true do |t|
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "finished"
  end

  create_table "memberships", force: true do |t|
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "round_robin_members", force: true do |t|
    t.integer  "user_id"
    t.integer  "round_robin_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "round_robins", force: true do |t|
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "round"
  end

  create_table "seasons", force: true do |t|
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "snake_positions", force: true do |t|
    t.integer "user_id"
    t.integer "draft_id"
    t.integer "position"
  end

  create_table "soldiers", force: true do |t|
    t.integer  "aim"
    t.integer  "stealth"
    t.integer  "sight"
    t.integer  "speed"
    t.integer  "hardiness"
    t.integer  "leadership"
    t.integer  "xp"
    t.integer  "age"
    t.integer  "damage"
    t.integer  "rank"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_id"
  end

  create_table "team_ownerships", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "league_id"
  end

  create_table "tokens", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.boolean  "on_squad"
  end

  create_table "units", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "token_id"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
