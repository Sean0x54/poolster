class CreateFootballNews < ActiveRecord::Migration[5.0]
  def change
    create_table :football_news do |t|

    	t.string :title
    	t.datetime :updated
    	t.string :url
    	t.string :content
    	t.string :source
    	t.string :terms_of_use
    	t.string :team
    	t.references :football_player

      t.timestamps null: false
    end
  end
end
