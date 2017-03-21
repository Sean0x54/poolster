class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    # create_table :weeks do |t|
    #   t.integer :number
    #   t.timestamp :start_time
    #   t.timestamp :end_time
    #   t.timestamps null: false
    # end
    #
    # create_table :teams do |t|
    #   t.string :name
    #   t.string :league
    #   t.timestamps null: false
    # end
    #
    # create_table :games do |t|
    #   t.integer :home_team_id
    #   t.integer :away_team_id
    #   t.timestamp :game_time
    #   t.integer :winner_team_id
    #   t.references :week
    #   t.timestamps null: false
    # end

    create_table :entries do |t|
      t.references :user
      t.references :pool
      t.references :game
      t.references :team
      t.integer :confidence_order
      t.boolean :won
      t.timestamps null: false
    end

  end
end
