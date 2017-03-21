class CreateFootballTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :football_teams do |t|
    	t.string :abbreviation, null: false
    	t.integer :player_id
    	t.string :city
    	t.string :name
    	t.string :conference
    	t.string :division
    	t.string :full_name
    	t.references :football_stadium, index: true, foreign_key: true
    	t.integer :bye_week
    	t.decimal :average_draft_position
    	t.decimal :average_draft_position_PPR
    	t.string :head_coach
    	t.string :offensive_coordinator
    	t.string :defensive_coordinator
    	t.string :special_teams_coach
    	t.string :offensive_scheme
    	t.string :defensive_scheme
    	t.integer :upcoming_salary
    	t.string :upcoming_opponent
    	t.integer :upcoming_opponent_rank
    	t.integer :upcoming_opponent_position_rank


      t.timestamps null: false
    end
  end
end
