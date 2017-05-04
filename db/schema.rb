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

ActiveRecord::Schema.define(version: 20170504030752) do

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

  create_table "football_games", force: :cascade do |t|
    t.string   "game_key",                              null: false
    t.datetime "date_time"
    t.integer  "season_type",                           null: false
    t.integer  "season",                                null: false
    t.integer  "week"
    t.string   "stadium"
    t.string   "playing_surface"
    t.integer  "temperature"
    t.integer  "humidity"
    t.integer  "wind_speed"
    t.string   "away_team",                             null: false
    t.string   "home_team",                             null: false
    t.integer  "away_score"
    t.integer  "home_score"
    t.integer  "total_score"
    t.decimal  "over_under"
    t.decimal  "point_spread"
    t.integer  "away_score_quarter_1"
    t.integer  "away_score_quarter_2"
    t.integer  "away_score_quarter_3"
    t.integer  "away_score_quarter_4"
    t.integer  "away_score_overtime"
    t.integer  "home_score_quarter_1"
    t.integer  "home_score_quarter_2"
    t.integer  "home_score_quarter_3"
    t.integer  "home_score_quarter_4"
    t.integer  "home_score_overtime"
    t.string   "away_time_of_possession"
    t.string   "home_time_of_possession"
    t.integer  "away_first_downs"
    t.integer  "home_first_downs"
    t.integer  "away_first_downs_by_rushing"
    t.integer  "home_first_downs_by_rushing"
    t.integer  "away_first_downs_by_passing"
    t.integer  "home_first_downs_by_passing"
    t.integer  "away_first_downs_by_penalty"
    t.integer  "home_first_downs_by_penalty"
    t.integer  "away_offensive_plays"
    t.integer  "home_offensive_plays"
    t.integer  "away_offensive_yards"
    t.integer  "home_offensive_yards"
    t.decimal  "away_offensive_yards_per_play"
    t.decimal  "home_offensive_yards_per_play"
    t.integer  "away_touchdowns"
    t.integer  "home_touchdowns"
    t.integer  "away_rushing_attempts"
    t.integer  "home_rushing_attempts"
    t.integer  "away_rushing_yards"
    t.integer  "home_rushing_yards"
    t.decimal  "away_rushing_yards_per_attempt"
    t.decimal  "home_rushing_yards_per_attempt"
    t.integer  "away_rushing_touchdowns"
    t.integer  "away_passing_touchdowns"
    t.integer  "away_passing_attempts"
    t.integer  "away_passing_completions"
    t.integer  "away_passing_yards"
    t.integer  "away_passing_interceptions"
    t.decimal  "away_passing_yards_per_attempt"
    t.decimal  "away_passing_yards_per_completion"
    t.integer  "home_rushing_touchdowns"
    t.integer  "home_passing_touchdowns"
    t.integer  "home_passing_attempts"
    t.integer  "home_passing_completions"
    t.integer  "home_passing_yards"
    t.integer  "home_passing_interceptions"
    t.decimal  "home_passing_yards_per_attempt"
    t.decimal  "home_passing_yards_per_completion"
    t.decimal  "away_completion_percentage"
    t.decimal  "away_passer_rating"
    t.integer  "away_third_down_attempt"
    t.integer  "away_third_down_conversions"
    t.decimal  "away_third_down_percentage"
    t.integer  "away_fourth_down_attempts"
    t.integer  "away_fourth_down_conversions"
    t.decimal  "away_fourth_down_percentage"
    t.decimal  "home_completion_percentage"
    t.decimal  "home_passer_rating"
    t.integer  "home_third_down_attempt"
    t.integer  "home_third_down_conversions"
    t.decimal  "home_third_down_percentage"
    t.integer  "home_fourth_down_attempts"
    t.integer  "home_fourth_down_conversions"
    t.decimal  "home_fourth_down_percentage"
    t.integer  "away_red_zone_attempts"
    t.integer  "away_red_zone_convesions"
    t.integer  "away_goal_to_go_attempts"
    t.integer  "away_goal_to_go_converstions"
    t.integer  "away_return_yards"
    t.integer  "away_penalties"
    t.integer  "away_penalty_yards"
    t.integer  "home_red_zone_attempts"
    t.integer  "home_red_zone_convesions"
    t.integer  "home_goal_to_go_attempts"
    t.integer  "home_goal_to_go_converstions"
    t.integer  "home_return_yards"
    t.integer  "home_penalties"
    t.integer  "home_penalty_yards"
    t.integer  "away_fumbles"
    t.integer  "away_fumbles_lost"
    t.integer  "away_times_sacked"
    t.integer  "away_times_sacked_yards"
    t.integer  "away_safeties"
    t.integer  "away_punts"
    t.integer  "away_punts_yards"
    t.decimal  "away_punt_average"
    t.integer  "away_give_aways"
    t.integer  "away_take_aways"
    t.integer  "home_fumbles"
    t.integer  "home_fumbles_lost"
    t.integer  "home_times_sacked"
    t.integer  "home_times_sacked_yards"
    t.integer  "home_safeties"
    t.integer  "home_punts"
    t.integer  "home_punts_yards"
    t.decimal  "home_punt_average"
    t.integer  "home_give_aways"
    t.integer  "home_take_aways"
    t.integer  "away_turn_over_differential"
    t.integer  "away_kickoffs"
    t.integer  "away_kickoffs_in_end_zone"
    t.integer  "away_kickoffs_touch_backs"
    t.integer  "away_punts_had_blocked"
    t.decimal  "away_punts_net_average"
    t.integer  "away_extra_point_kicking_attempts"
    t.integer  "home_turn_over_differential"
    t.integer  "home_kickoffs"
    t.integer  "home_kickoffs_in_end_zone"
    t.integer  "home_kickoffs_touch_backs"
    t.integer  "home_punts_had_blocked"
    t.decimal  "home_punts_net_average"
    t.integer  "home_extra_point_kicking_attempts"
    t.integer  "away_extra_point_kicking_conversions"
    t.integer  "away_extra_points_had_blocked"
    t.integer  "away_extra_points_passing_attempts"
    t.integer  "away_extra_points_passing_conversions"
    t.integer  "away_extra_point_rushing_attempts"
    t.integer  "away_extra_point_rushing_conversions"
    t.integer  "away_field_goal_attempts"
    t.integer  "home_extra_point_kicking_conversions"
    t.integer  "home_extra_points_had_blocked"
    t.integer  "home_extra_points_passing_attempts"
    t.integer  "home_extra_points_passing_conversions"
    t.integer  "home_extra_point_rushing_attempts"
    t.integer  "home_extra_point_rushing_conversions"
    t.integer  "home_field_goal_attempts"
    t.integer  "away_field_goals_made"
    t.integer  "away_field_goals_had_blocked"
    t.integer  "away_punt_return"
    t.integer  "away_punt_return_yards"
    t.integer  "away_kick_returns"
    t.integer  "away_kick_return_yards"
    t.integer  "away_interception_returns"
    t.integer  "away_interception_return_yards"
    t.integer  "home_field_goals_made"
    t.integer  "home_field_goals_had_blocked"
    t.integer  "home_punt_return"
    t.integer  "home_punt_return_yards"
    t.integer  "home_kick_returns"
    t.integer  "home_kick_return_yards"
    t.integer  "home_interception_returns"
    t.integer  "home_interception_return_yards"
    t.integer  "away_solo_tackles"
    t.integer  "away_assisted_tackles"
    t.integer  "away_quarter_back_hits"
    t.integer  "away_tackles_for_loss"
    t.integer  "away_sack"
    t.integer  "away_sacked_yards"
    t.integer  "away_passes_defended"
    t.integer  "away_fumbles_forced"
    t.integer  "away_fumbles_recovered"
    t.integer  "away_fumble_return_yards"
    t.integer  "away_fumble_return_touchtowns"
    t.integer  "away_interceptions_return_touchdowns"
    t.integer  "away_blocked_kicks"
    t.integer  "away_punt_return_touchdowns"
    t.integer  "away_punt_return_long"
    t.integer  "away_kick_return_touchdowns"
    t.integer  "away_kick_return_long"
    t.integer  "away_blocked_kick_return_yards"
    t.integer  "away_blocked_kick_return_touchdowns"
    t.integer  "away_field_goal_return_yards"
    t.integer  "away_field_goal_return_touchdowns"
    t.integer  "away_punt_net_yards"
    t.integer  "home_solo_tackles"
    t.integer  "home_assisted_tackles"
    t.integer  "home_quarter_back_hits"
    t.integer  "home_tackles_for_loss"
    t.integer  "home_sack"
    t.integer  "home_sacked_yards"
    t.integer  "home_passes_defended"
    t.integer  "home_fumbles_forced"
    t.integer  "home_fumbles_recovered"
    t.integer  "home_fumble_return_yards"
    t.integer  "home_fumble_return_touchtowns"
    t.integer  "home_interceptions_return_touchdowns"
    t.integer  "home_blocked_kicks"
    t.integer  "home_punt_return_touchdowns"
    t.integer  "home_punt_return_long"
    t.integer  "home_kick_return_touchdowns"
    t.integer  "home_kick_return_long"
    t.integer  "home_blocked_kick_return_yards"
    t.integer  "home_blocked_kick_return_touchdowns"
    t.integer  "home_field_goal_return_yards"
    t.integer  "home_field_goal_return_touchdowns"
    t.integer  "home_punt_net_yards"
    t.boolean  "is_game_over"
    t.integer  "football_stadium_id"
    t.integer  "away_two_point_conversion_returns"
    t.integer  "home_two_point_conversion_returns"
    t.integer  "away_team_money_line"
    t.integer  "home_team_money_line"
    t.integer  "forecast_temp_low"
    t.integer  "forecast_temp_high"
    t.integer  "forecast_description"
    t.integer  "forecast_wind_chill"
    t.integer  "forecast_wind_speed"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["football_stadium_id"], name: "index_football_games_on_football_stadium_id", using: :btree
  end

  create_table "football_news", force: :cascade do |t|
    t.string   "title"
    t.datetime "updated"
    t.string   "url"
    t.string   "content"
    t.string   "source"
    t.string   "terms_of_use"
    t.string   "team"
    t.integer  "football_player_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["football_player_id"], name: "index_football_news_on_football_player_id", using: :btree
  end

  create_table "football_schedules", force: :cascade do |t|
    t.string   "game_key",             null: false
    t.integer  "football_stadium_id"
    t.datetime "date_time"
    t.integer  "season_type",          null: false
    t.integer  "season",               null: false
    t.integer  "week",                 null: false
    t.string   "away_team"
    t.string   "home_team"
    t.string   "channel"
    t.decimal  "point_spread"
    t.decimal  "over_under"
    t.decimal  "geo_lat"
    t.decimal  "geo_long"
    t.integer  "forecast_temp_low"
    t.integer  "forecast_temp_high"
    t.string   "forecast_description"
    t.integer  "forecast_wind_chill"
    t.integer  "forecast_wind_speed"
    t.integer  "away_team_money_line"
    t.integer  "home_team_money_line"
    t.boolean  "canceled"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["football_stadium_id"], name: "index_football_schedules_on_football_stadium_id", using: :btree
  end

  create_table "football_scores", force: :cascade do |t|
    t.string   "game_key"
    t.integer  "season_type"
    t.integer  "season"
    t.integer  "week"
    t.datetime "date"
    t.string   "away_team"
    t.string   "home_team"
    t.integer  "away_score"
    t.integer  "home_score"
    t.string   "channel"
    t.decimal  "point_spread"
    t.decimal  "over_under"
    t.string   "quarter"
    t.string   "time_remaining"
    t.string   "possession"
    t.integer  "down"
    t.string   "distance"
    t.integer  "yard_line"
    t.string   "yard_line_territory"
    t.string   "red_zone"
    t.integer  "away_score_quarter_1"
    t.integer  "away_score_quarter_2"
    t.integer  "away_score_quarter_3"
    t.integer  "away_score_quarter_4"
    t.integer  "away_score_overtime"
    t.integer  "home_score_quarter_1"
    t.integer  "home_score_quarter_2"
    t.integer  "home_score_quarter_3"
    t.integer  "home_score_quarter_4"
    t.integer  "home_score_overtime"
    t.boolean  "has_started"
    t.boolean  "is_in_progress"
    t.boolean  "is_over"
    t.boolean  "has_1st_quarter_started"
    t.boolean  "has_2st_quarter_started"
    t.boolean  "has_3st_quarter_started"
    t.boolean  "has_4st_quarter_started"
    t.boolean  "is_overtime"
    t.string   "down_and_distance"
    t.string   "quarter_description"
    t.integer  "stadiumID"
    t.datetime "last_updated"
    t.decimal  "geo_lat"
    t.decimal  "geo_long"
    t.integer  "forecast_templow"
    t.integer  "forecast_temphigh"
    t.string   "forecast_description"
    t.integer  "forecast_windchill"
    t.integer  "forecast_windspeed"
    t.integer  "away_team_money_line"
    t.integer  "home_team_money_line"
    t.decimal  "canceled"
    t.boolean  "closed"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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

  add_foreign_key "football_games", "football_stadiums"
  add_foreign_key "football_schedules", "football_stadiums"
  add_foreign_key "football_teams", "football_stadiums"
  add_foreign_key "pool_memberships", "pools"
  add_foreign_key "pool_memberships", "users"
  add_foreign_key "pools", "users", column: "owner_id"
end
