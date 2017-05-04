class Football::Score < ActiveRecord::Base
	belongs_to :game, class_name: Football::Game,  foreign_key: :game_key, primary_key: :game_key
	#define fantasy data possible values for quarter
	#validates_inclusion_of :quarter, :in => %w(1 2 3 4 Half OT F F/OT), allow_nil: true
        validates_presence_of :game_key

end
