class Football::Schedule < ActiveRecord::Base
	belongs_to :football_stadium, class_name: Football::Stadium

  validates :season,         presence: true
  validates :season_type,    presence: true
  validates :home_team,      presence: true
  validates :away_team,      presence: true
  validates_presence_of :week
  validates_presence_of :game_key
end
