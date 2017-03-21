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

ActiveRecord::Schema.define(version: 20170321052007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pool_id"
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "confidence_order"
    t.boolean  "won"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["game_id"], name: "index_entries_on_game_id", using: :btree
    t.index ["pool_id"], name: "index_entries_on_pool_id", using: :btree
    t.index ["team_id"], name: "index_entries_on_team_id", using: :btree
    t.index ["user_id"], name: "index_entries_on_user_id", using: :btree
  end

  create_table "football_stadiums", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "capacity"
    t.string   "surface"
    t.decimal  "geo_lat"
    t.decimal  "geo_long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "football_teams", force: :cascade do |t|
    t.string   "abbreviation",                    null: false
    t.integer  "player_id"
    t.string   "city"
    t.string   "name"
    t.string   "conference"
    t.string   "division"
    t.string   "full_name"
    t.integer  "football_stadium_id"
    t.integer  "bye_week"
    t.decimal  "average_draft_position"
    t.decimal  "average_draft_position_PPR"
    t.string   "head_coach"
    t.string   "offensive_coordinator"
    t.string   "defensive_coordinator"
    t.string   "special_teams_coach"
    t.string   "offensive_scheme"
    t.string   "defensive_scheme"
    t.integer  "upcoming_salary"
    t.string   "upcoming_opponent"
    t.integer  "upcoming_opponent_rank"
    t.integer  "upcoming_opponent_position_rank"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["football_stadium_id"], name: "index_football_teams_on_football_stadium_id", using: :btree
  end

  create_table "football_timeframes", force: :cascade do |t|
    t.integer  "season_type",            null: false
    t.integer  "season",                 null: false
    t.integer  "week"
    t.string   "name",                   null: false
    t.string   "short_name",             null: false
    t.datetime "start_date",             null: false
    t.datetime "end_date",               null: false
    t.datetime "first_game_start"
    t.datetime "first_game_end"
    t.datetime "last_game_end"
    t.boolean  "has_games",              null: false
    t.boolean  "has_started",            null: false
    t.boolean  "has_ended",              null: false
    t.boolean  "has_first_game_started", null: false
    t.boolean  "has_first_game_ended",   null: false
    t.boolean  "has_last_game_ended",    null: false
    t.string   "api_season"
    t.string   "api_week"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pool_memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pool_id"], name: "index_pool_memberships_on_pool_id", using: :btree
    t.index ["user_id", "pool_id"], name: "index_pool_memberships_on_user_id_and_pool_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_pool_memberships_on_user_id", using: :btree
  end

  create_table "pools", force: :cascade do |t|
    t.string   "name",                       null: false
    t.boolean  "is_public",  default: false
    t.integer  "owner_id",                   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["owner_id"], name: "index_pools_on_owner_id", using: :btree
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "football_teams", "football_stadiums"
  add_foreign_key "pool_memberships", "pools"
  add_foreign_key "pool_memberships", "users"
  add_foreign_key "pools", "users", column: "owner_id"
end
