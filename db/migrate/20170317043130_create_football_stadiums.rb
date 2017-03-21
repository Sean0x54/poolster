class CreateFootballStadiums < ActiveRecord::Migration[5.0]
  def change
    create_table :football_stadiums do |t|
    	t.string :name, null: false
    	t.string :city
    	t.string :state
    	t.string :country
    	t.integer :capacity
    	t.string :surface
      t.decimal :geo_lat
      t.decimal :geo_long

      t.timestamps null: false
    end
  end
end
