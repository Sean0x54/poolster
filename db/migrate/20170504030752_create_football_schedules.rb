class CreateFootballSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :football_schedules do |t|

      t.string :game_key, null: false
    	t.references :football_stadium, index: true, foreign_key: true
      t.datetime :date_time
      t.integer :season_type, null: false
      t.integer :season, null: false
      t.integer :week, null: false
      t.string :away_team
      t.string :home_team
      t.string :channel
      t.decimal :point_spread
      t.decimal :over_under
      t.decimal :geo_lat
      t.decimal :geo_long
      t.integer :forecast_temp_low
      t.integer :forecast_temp_high
      t.string :forecast_description
      t.integer :forecast_wind_chill
      t.integer :forecast_wind_speed
      t.integer :away_team_money_line
      t.integer :home_team_money_line
      t.boolean :canceled

      t.timestamps null: false
    end
  end
end
