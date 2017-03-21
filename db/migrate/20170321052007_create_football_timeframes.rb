class CreateFootballTimeframes < ActiveRecord::Migration[5.0]
  def change
    create_table :football_timeframes do |t|
      t.integer :season_type, null: false
      t.integer :season, null: false
      t.integer :week
      t.string :name, null: false
      t.string :short_name, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.datetime :first_game_start
      t.datetime :first_game_end
      t.datetime :last_game_end
      t.boolean :has_games, null: false
      t.boolean :has_started, null: false
      t.boolean :has_ended, null: false
      t.boolean :has_first_game_started, null: false
      t.boolean :has_first_game_ended, null: false
      t.boolean :has_last_game_ended, null: false
      t.string :api_season
      t.string :api_week

      t.timestamps
    end
  end
end
