class CreateFootballScores < ActiveRecord::Migration[5.0]
  def change
    create_table :football_scores do |t|

    	t.string :game_key
    	t.integer :season_type
    	t.integer :season
    	t.integer :week
    	t.datetime :date
    	t.string :away_team
    	t.string :home_team
    	t.integer :away_score
    	t.integer :home_score
    	t.string :channel
    	t.decimal :point_spread
    	t.decimal :over_under
    	t.string :quarter
    	t.string :time_remaining
    	t.string :possession
    	t.integer :down
    	t.string :distance
    	t.integer :yard_line
    	t.string :yard_line_territory
    	t.string :red_zone
    	t.integer :away_score_quarter_1
    	t.integer :away_score_quarter_2
    	t.integer :away_score_quarter_3
    	t.integer :away_score_quarter_4
    	t.integer :away_score_overtime
    	t.integer :home_score_quarter_1
    	t.integer :home_score_quarter_2
    	t.integer :home_score_quarter_3
    	t.integer :home_score_quarter_4
    	t.integer :home_score_overtime
    	t.boolean :has_started
    	t.boolean :is_in_progress
    	t.boolean :is_over
    	t.boolean :has_1st_quarter_started
    	t.boolean :has_2st_quarter_started
    	t.boolean :has_3st_quarter_started
    	t.boolean :has_4st_quarter_started
    	t.boolean :is_overtime
    	t.string :down_and_distance
      t.string :quarter_description
      t.integer :stadiumID
      t.datetime :last_updated
      t.decimal :geo_lat
      t.decimal :geo_long
      t.integer :forecast_templow
      t.integer :forecast_temphigh
      t.string :forecast_description
      t.integer :forecast_windchill
      t.integer :forecast_windspeed
      t.integer :away_team_money_line
      t.integer :home_team_money_line
      t.decimal :canceled
      t.boolean :closed

      t.timestamps null: false
    end
  end
end
