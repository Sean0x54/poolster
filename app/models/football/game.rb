class Football::Game < ActiveRecord::Base
  belongs_to :football_stadium, class_name: Football::Stadium
  has_one    :score, class_name: Football::Score, foreign_key: :game_key, primary_key: :game_key
  validates :season,         presence: true
  validates :season_type,    presence: true
  validates :home_team,      presence: true
  validates :away_team,      presence: true
  validates_presence_of :game_key
  alias_attribute :day, :date_time


  default_scope {includes(:score)}
  # this should go from the contest day to Tuesday morning (monday 23:59:59) as that's when football contests end.
  scope :on_day, -> ( day ) { where date_time: day.beginning_of_day..day.beginning_of_week.advance(weeks: 1).end_of_day }
  scope :future, -> { where( "football_games.date_time > now()" ) }
  scope :past,   -> { where "football_games.date_time < now()" }
  scope :after, -> ( dt ) { where("football_games.date_time >= ?", dt) }
  scope :final, -> { where( is_game_over: true ) }
  scope :playable, -> { future }

  #define methods to delegate to score model
  [:quarter, :time_remaining, :down, :distance, :has_started,
    :is_in_progress, :is_over, :down_and_distance, :quarter_description, :possession, :home_score, :away_score, :red_zone,
    :yard_line, :yard_line_territory].each do |method|
      delegate method, to: :score, allow_nil: :true
  end

  def sport
    'football'
  end


  def self.start_times day
    #TODO fix once we have Status for NFL
    self.on_day( day ).playable.order( date_time: :asc ).uniq.pluck(:date_time)
  end

  def self.all_start_times day
    #static start_times so game block times don't change
    #TODO fix once we have Status for NFL
    self.on_day(day).order(date_time: :asc).uniq.pluck(:date_time)
  end


  # Get all NFL weeks with their date ranges
  def self.weeks_all
    game_times = Football::Game.group("DATE_TRUNC('week', date_time::TIMESTAMPTZ AT TIME ZONE '#{Time.zone.now.formatted_offset}'::INTERVAL)").
                                order("DATE_TRUNC('week', date_time::TIMESTAMPTZ AT TIME ZONE '#{Time.zone.now.formatted_offset}'::INTERVAL)").
                                count

    dates = []
    game_times.each_with_index { |k, index|
      date = k[0].to_date
      week_beg = date.in_time_zone("Eastern Time (US & Canada)").to_datetime.beginning_of_week
      week_end = date.in_time_zone("Eastern Time (US & Canada)").to_datetime.end_of_week
      thurs = week_beg.advance(days: 3).change({hour: 20, min: 25}).in_time_zone("Eastern Time (US & Canada)")
      sun_base = week_beg.advance(days: 6).in_time_zone("Eastern Time (US & Canada)")
      sun1 = sun_base.change({hour: 13, min: 0}).in_time_zone("Eastern Time (US & Canada)")
      sun2 = sun_base.change({hour: 16, min: 0}).in_time_zone("Eastern Time (US & Canada)")
      sun3 = sun_base.change({hour: 20, min: 30}).in_time_zone("Eastern Time (US & Canada)")
      dates << {
        :week => index+1,
        :start => week_beg,
        :days => [
          :th => thurs,
          :s1 => sun1,
          :s2 => sun2,
          :s3 => sun3,
        ],
        :end => week_end
      }
    }
    return dates
  end

  # Get this week's week # & dates
  def self.this_week
    set = self.weeks_all
    date = Time.now
    return set.select{|w| date >= w[:start] && date <= w[:end]}[0]
  end

  # Get week info for only current & remaining weeks
  def self.weeks_remaining
    set = self.weeks_all
    date = Time.now
    return set.select{|w| date <= w[:start] || (date >= w[:start] && date <= w[:end])}
  end


  def self.dates_for_week(wk)
    set = self.weeks_remaining.select{|s| s[:week] == wk.to_i}
  end

  def self.all_start_times(game_week)
  end

  def status
    score
  end


  [['has_started', 'started?'],
   ['is_in_progress', 'in_progress?'],
   ['canceled', 'canceled?']].each{ |s| define_method("#{s[1]}") { return status[s[0]] if status } }

  # simple convenience methods since they're available
  alias_method :postponed?, :canceled?
  alias_method :suspended?, :canceled?
  alias_method :started_and_not_over?, :in_progress?

  def final?
    score.is_over rescue false
  end

  def scheduled?
    !canceled?
  end

  def is_over?
    score.is_over rescue false
  end
  alias_method :over?, :is_over?

  def is_halftime?
    quarter == 'Half'
  end

  def down_and_distance_display
     current_down = down.present? ? down.ordinalize : nil
    (is_in_progress && !is_halftime? && current_down && distance) ? "#{current_down} & #{distance}" : nil
  end

  def yard_line_display
    (is_in_progress && !is_halftime?) ? "#{yard_line_territory} #{yard_line}" : nil
  end

  def data_refresh
    #specificaally call delegated methods in object serialization
    game = self.attributes
    game[:down_and_distance] = down_and_distance_display #methods that are delegated to score model
    game[:yard_line_display] = yard_line_display
    game[:possession] = possession
    game[:home_score] = home_score
    game[:away_score] = away_score
    game
  end

end
