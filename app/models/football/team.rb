class Football::Team < ActiveRecord::Base
  belongs_to :football_stadium, class_name: Football::Stadium
	# has_many :football_games, class_name: Football::Game
  validates_presence_of :abbreviation
end
