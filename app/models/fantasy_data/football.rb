class FantasyData::Football < FantasyData::Base
  base_url Rails.application.secrets.fantasy_data_nfl_site

  get :stadiums, "/scores/json/Stadiums"
  get :active_teams, "/scores/json/Teams"
  get :schedules, "/scores/json/Schedules/:season"
  get :bye_week, "/scores/json/Byes/:season"
  get :news_by_team, "/scores/json/NewsByPlayerID/:team"
  get :news_recent, "/scores/json/News"
  get :scores_by_season, "/scores/json/Scores/:season"
  get :scores_by_week, "/scores/json/ScoresByWeek/:season/:week"
  get :season_current, "/scores/json/CurrentSeason"
  get :time_frames, "/scores/json/Timeframes/current"
  get :recent_time_frames, "/scores/json/Timeframes/recent"
  get :upcoming_time_frames, "/scores/json/Timeframes/upcoming"
  get :completed_time_frames, "/scores/json/Timeframes/completed"
  get :all_time_frames, "/scores/json/Timeframes/all"
  get :standings, "/scores/json/Standings/:season"
  get :box_scores_final, "/stats/json/FinalBoxScores"
  get :box_scores_live, "/stats/json/LiveBoxScores"

  def self.current_week
    time_frames.first.ApiWeek
  end

  def self.upcoming_week
    upcoming_time_frames.first.ApiWeek
  end

  def self.last_week
    completed_time_frames.first.ApiWeek
  end

  def self.current_season
    time_frames.first.ApiSeason
  end

  def self.upcoming_season
    upcoming_time_frames.first.ApiSeason
  end

  # think of this as last weeks seasons
  def self.last_season
    completed_time_frames.first.ApiSeason
  end

  def self.are_games_in_progress?
    _plain_request('/scores/json/AreAnyGamesInProgress', :get).eql?("true")
  end

  def self.create_or_update_news news
    return unless news.NewsID
    s = ::Football::News.find_or_initialize_by( id: news.NewsID )
    s.title                          = news.Title
    s.updated                        = news.Updated
    s.url                            = news.Url
    s.content                        = news.Content
    s.source                         = news.Source
    s.terms_of_use                   = news.TermsOfUse
    s.football_player_id             = news.PlayerID
    s.team                           = news.Team

    s.save
  end

  def self.create_or_update_stadium stadium
    return unless stadium.StadiumID
    s = ::Football::Stadium.find_or_initialize_by( id: stadium.StadiumID )
    s.name                    = CGI.unescapeHTML stadium.Name
    s.city                    = stadium.City
    s.state                   = stadium.State
    s.country                 = stadium.Country
    s.capacity                = stadium.Capacity
    s.surface                 = stadium.PlayingSurface
    s.geo_lat                 = stadium.GeoLat
    s.geo_long                = stadium.GeoLong

    s.save
  end

  def self.create_or_update_game game
    return unless game.GameKey
    s = ::Football::Game.find_or_initialize_by( game_key: game.GameKey )
    Rails.logger.info "GAME: %s %s vs %s" % [ game.GameKey, game.AwayTeam, game.HomeTeam ]

    s.game_key                             =game.GameKey
    s.date_time                            =game.Date
    s.season_type                          =game.SeasonType
    s.season                               =game.Season
    s.week                                 =game.Week
    s.stadium                              =game.Stadium
    s.playing_surface                      =game.PlayingSurface
    s.temperature                          =game.Temperature
    s.humidity                             =game.Humidity
    s.wind_speed                           =game.WindSpeed
    s.away_team                            =game.AwayTeam
    s.home_team                            =game.HomeTeam
    s.away_score                           =game.AwayScore
    s.home_score                           =game.HomeScore
    s.total_score                          =game.TotalScore
    s.over_under                           =game.OverUnder
    s.point_spread                         =game.PointSpread
    s.away_score_quarter_1                 =game.AwayScoreQuarter1
    s.away_score_quarter_2                 =game.AwayScoreQuarter2
    s.away_score_quarter_3                 =game.AwayScoreQuarter3
    s.away_score_quarter_4                 =game.AwayScoreQuarter4
    s.away_score_overtime                  =game.AwayScoreOvertime
    s.home_score_quarter_1                 =game.HomeScoreQuarter1
    s.home_score_quarter_2                 =game.HomeScoreQuarter2
    s.home_score_quarter_3                 =game.HomeScoreQuarter3
    s.home_score_quarter_4                 =game.HomeScoreQuarter4
    s.home_score_overtime                  =game.HomeScoreOvertime
    s.away_time_of_possession              =game.AwayTimeOfPossession
    s.home_time_of_possession              =game.HomeTimeOfPossession
    s.away_first_downs                     =game.AwayFirstDowns
    s.home_first_downs                     =game.HomeFirstDowns
    s.away_first_downs_by_rushing          =game.AwayFirstDownsByRushing
    s.home_first_downs_by_rushing          =game.HomeFirstDownsByRushing
    s.away_first_downs_by_passing          =game.AwayFirstDownsByPassing
    s.home_first_downs_by_passing          =game.HomeFirstDownsByPassing
    s.away_first_downs_by_penalty          =game.AwayFirstDownsByPenalty
    s.home_first_downs_by_penalty          =game.HomeFirstDownsByPenalty
    s.away_offensive_plays                 =game.AwayOffensivePlays
    s.home_offensive_plays                 =game.HomeOffensivePlays
    s.away_offensive_yards                 =game.AwayOffensiveYards
    s.home_offensive_yards                 =game.HomeOffensiveYards
    s.away_offensive_yards_per_play        =game.AwayOffensiveYardsPerPlay
    s.home_offensive_yards_per_play        =game.HomeOffensiveYardsPerPlay
    s.away_touchdowns                      =game.AwayTouchdowns
    s.home_touchdowns                      =game.HomeTouchdowns
    s.away_rushing_attempts                =game.AwayRushingAttempts
    s.home_rushing_attempts                =game.HomeRushingAttempts
    s.away_rushing_yards                   =game.AwayRushingYards
    s.home_rushing_yards                   =game.HomeRushingYards
    s.away_rushing_yards_per_attempt       =game.AwayRushingYardsPerAttempt
    s.home_rushing_yards_per_attempt       =game.HomeRushingYardsPerAttempt
    s.away_rushing_touchdowns              =game.AwayRushingTouchdowns
    s.away_passing_touchdowns              =game.AwayPassingTouchdowns
    s.away_passing_attempts                =game.AwayPassingAttempts
    s.away_passing_completions             =game.AwayPassingCompletions
    s.away_passing_yards                   =game.AwayPassingYards
    s.away_passing_interceptions           =game.AwayPassingInterceptions
    s.away_passing_yards_per_attempt       =game.AwayPassingYardsPerAttempt
    s.away_passing_yards_per_completion    =game.AwayPassingYardsPerCompletion
    s.home_rushing_touchdowns              =game.HomeRushingTouchdowns
    s.home_passing_touchdowns              =game.HomePassingTouchdowns
    s.home_passing_attempts                =game.HomePassingAttempts
    s.home_passing_completions             =game.HomePassingCompletions
    s.home_passing_yards                   =game.HomePassingYards
    s.home_passing_interceptions           =game.HomePassingInterceptions
    s.home_passing_yards_per_attempt       =game.HomePassingYardsPerAttempt
    s.home_passing_yards_per_completion    =game.HomePassingYardsPerCompletion
    s.away_completion_percentage           =game.AwayCompletionPercentage
    s.away_passer_rating                   =game.AwayPasserRating
    s.away_third_down_attempt              =game.AwayThirdDownAttempts
    s.away_third_down_conversions          =game.AwayThirdDownConversions
    s.away_third_down_percentage           =game.AwayThirdDownPercentage
    s.away_fourth_down_attempts            =game.AwayFourthDownAttempts
    s.away_fourth_down_conversions         =game.AwayFourthDownConversions
    s.away_fourth_down_percentage          =game.AwayFourthDownPercentage
    s.home_completion_percentage           =game.HomeCompletionPercentage
    s.home_passer_rating                   =game.HomePasserRating
    s.home_third_down_attempt              =game.HomeThirdDownAttempts
    s.home_third_down_conversions          =game.HomeThirdDownConversions
    s.home_third_down_percentage           =game.HomeThirdDownPercentage
    s.home_fourth_down_attempts            =game.HomeFourthDownAttempts
    s.home_fourth_down_conversions         =game.HomeFourthDownConversions
    s.home_fourth_down_percentage          =game.HomeFourthDownPercentage
    s.away_red_zone_attempts               =game.AwayRedZoneAttempts
    s.away_red_zone_convesions             =game.AwayRedZoneConversions
    s.away_goal_to_go_attempts             =game.AwayGoalToGoAttempts
    s.away_goal_to_go_converstions         =game.AwayGoalToGoConversions
    s.away_return_yards                    =game.AwayReturnYards
    s.away_penalties                       =game.AwayPenalties
    s.away_penalty_yards                   =game.AwayPenaltyYards
    s.home_red_zone_attempts               =game.HomeRedZoneAttempts
    s.home_red_zone_convesions             =game.HomeRedZoneConversions
    s.home_goal_to_go_attempts             =game.HomeGoalToGoAttempts
    s.home_goal_to_go_converstions         =game.HomeGoalToGoConversions
    s.home_return_yards                    =game.HomeReturnYards
    s.home_penalties                       =game.HomePenalties
    s.home_penalty_yards                   =game.HomePenaltyYards
    s.away_fumbles                         =game.AwayFumbles
    s.away_fumbles_lost                    =game.AwayFumblesLost
    s.away_times_sacked                    =game.AwayTimesSacked
    s.away_times_sacked_yards              =game.AwayTimesSackedYards
    s.away_safeties                        =game.AwaySafeties
    s.away_punts                           =game.AwayPunts
    s.away_punts_yards                     =game.AwayPuntYards
    s.away_punt_average                    =game.AwayPuntAverage
    s.away_give_aways                      =game.AwayGiveaways
    s.away_take_aways                      =game.AwayTakeaways
    s.home_fumbles                         =game.HomeFumbles
    s.home_fumbles_lost                    =game.HomeFumblesLost
    s.home_times_sacked                    =game.HomeTimesSacked
    s.home_times_sacked_yards              =game.HomeTimesSackedYards
    s.home_safeties                        =game.HomeSafeties
    s.home_punts                           =game.HomePunts
    s.home_punts_yards                     =game.HomePuntYards
    s.home_punt_average                    =game.HomePuntAverage
    s.home_give_aways                      =game.HomeGiveaways
    s.home_take_aways                      =game.HomeTakeaways
    s.away_turn_over_differential          =game.AwayTurnoverDifferential
    s.away_kickoffs                        =game.AwayKickoffs
    s.away_kickoffs_in_end_zone            =game.AwayKickoffsInEndZone
    s.away_kickoffs_touch_backs            =game.AwayKickoffTouchbacks
    s.away_punts_had_blocked               =game.AwayPuntsHadBlocked
    s.away_punts_net_average               =game.AwayPuntNetAverage
    s.away_extra_point_kicking_attempts    =game.AwayExtraPointKickingAttempts
    s.home_turn_over_differential          =game.HomeTurnoverDifferential
    s.home_kickoffs                        =game.HomeKickoffs
    s.home_kickoffs_in_end_zone            =game.HomeKickoffsInEndZone
    s.home_kickoffs_touch_backs            =game.HomeKickoffTouchbacks
    s.home_punts_had_blocked               =game.HomePuntsHadBlocked
    s.home_punts_net_average               =game.HomePuntNetAverage
    s.home_extra_point_kicking_attempts    =game.HomeExtraPointKickingAttempts
    s.away_extra_point_kicking_conversions =game.AwayExtraPointKickingConversions
    s.away_extra_points_had_blocked        =game.AwayExtraPointsHadBlocked
    s.away_extra_points_passing_attempts   =game.AwayExtraPointPassingAttempts
    s.away_extra_points_passing_conversions=game.AwayExtraPointPassingConversions
    s.away_extra_point_rushing_attempts    =game.AwayExtraPointRushingAttempts
    s.away_extra_point_rushing_conversions =game.AwayExtraPointRushingConversions
    s.away_field_goal_attempts             =game.AwayFieldGoalAttempts
    s.home_extra_point_kicking_conversions =game.HomeExtraPointKickingConversions
    s.home_extra_points_had_blocked        =game.HomeExtraPointsHadBlocked
    s.home_extra_points_passing_attempts   =game.HomeExtraPointPassingAttempts
    s.home_extra_points_passing_conversions=game.HomeExtraPointPassingConversions
    s.home_extra_point_rushing_attempts    =game.HomeExtraPointRushingAttempts
    s.home_extra_point_rushing_conversions =game.HomeExtraPointRushingConversions
    s.home_field_goal_attempts             =game.HomeFieldGoalAttempts
    s.away_field_goals_made                =game.AwayFieldGoalsMade
    s.away_field_goals_had_blocked         =game.AwayFieldGoalsHadBlocked
    s.away_punt_return                     =game.AwayPuntReturns
    s.away_punt_return_yards               =game.AwayPuntReturnYards
    s.away_kick_returns                    =game.AwayKickReturns
    s.away_kick_return_yards               =game.AwayKickReturnYards
    s.away_interception_returns            =game.AwayInterceptionReturns
    s.away_interception_return_yards       =game.AwayInterceptionReturnYards
    s.home_field_goals_made                =game.HomeFieldGoalsMade
    s.home_field_goals_had_blocked         =game.HomeFieldGoalsHadBlocked
    s.home_punt_return                     =game.HomePuntReturns
    s.home_punt_return_yards               =game.HomePuntReturnYards
    s.home_kick_returns                    =game.HomeKickReturns
    s.home_kick_return_yards               =game.HomeKickReturnYards
    s.home_interception_returns            =game.HomeInterceptionReturns
    s.home_interception_return_yards       =game.HomeInterceptionReturnYards
    s.away_solo_tackles                    =game.AwaySoloTackles
    s.away_assisted_tackles                =game.AwayAssistedTackles
    s.away_quarter_back_hits               =game.AwayQuarterbackHits
    s.away_tackles_for_loss                =game.AwayTacklesForLoss
    s.away_sack                            =game.AwaySacks
    s.away_sacked_yards                    =game.AwaySackYards
    s.away_passes_defended                 =game.AwayPassesDefended
    s.away_fumbles_forced                  =game.AwayFumblesForced
    s.away_fumbles_recovered               =game.AwayFumblesRecovered
    s.away_fumble_return_yards             =game.AwayFumbleReturnYards
    s.away_fumble_return_touchtowns        =game.AwayFumbleReturnTouchdowns
    s.away_interceptions_return_touchdowns =game.AwayInterceptionReturnTouchdowns
    s.away_blocked_kicks                   =game.AwayBlockedKicks
    s.away_punt_return_touchdowns          =game.AwayPuntReturnTouchdowns
    s.away_punt_return_long                =game.AwayPuntReturnLong
    s.away_kick_return_touchdowns          =game.AwayKickReturnTouchdowns
    s.away_kick_return_long                =game.AwayKickReturnLong
    s.away_blocked_kick_return_yards       =game.AwayBlockedKickReturnYards
    s.away_blocked_kick_return_touchdowns  =game.AwayBlockedKickReturnTouchdowns
    s.away_field_goal_return_yards         =game.AwayFieldGoalReturnYards
    s.away_field_goal_return_touchdowns    =game.AwayFieldGoalReturnTouchdowns
    s.away_punt_net_yards                  =game.AwayPuntNetYards
    s.home_solo_tackles                    =game.HomeSoloTackles
    s.home_assisted_tackles                =game.HomeAssistedTackles
    s.home_quarter_back_hits               =game.HomeQuarterbackHits
    s.home_tackles_for_loss                =game.HomeTacklesForLoss
    s.home_sack                            =game.HomeSacks
    s.home_sacked_yards                    =game.HomeSackYards
    s.home_passes_defended                 =game.HomePassesDefended
    s.home_fumbles_forced                  =game.HomeFumblesForced
    s.home_fumbles_recovered               =game.HomeFumblesRecovered
    s.home_fumble_return_yards             =game.HomeFumbleReturnYards
    s.home_fumble_return_touchtowns        =game.HomeFumbleReturnTouchdowns
    s.home_interceptions_return_touchdowns =game.HomeInterceptionReturnTouchdowns
    s.home_blocked_kicks                   =game.HomeBlockedKicks
    s.home_punt_return_touchdowns          =game.HomePuntReturnTouchdowns
    s.home_punt_return_long                =game.HomePuntReturnLong
    s.home_kick_return_touchdowns          =game.HomeKickReturnTouchdowns
    s.home_kick_return_long                =game.HomeKickReturnLong
    s.home_blocked_kick_return_yards       =game.HomeBlockedKickReturnYards
    s.home_blocked_kick_return_touchdowns  =game.HomeBlockedKickReturnTouchdowns
    s.home_field_goal_return_yards         =game.HomeFieldGoalReturnYards
    s.home_field_goal_return_touchdowns    =game.HomeFieldGoalReturnTouchdowns
    s.home_punt_net_yards                  =game.HomePuntNetYards
    s.is_game_over                         =game.IsGameOver.eql?(true)
    s.football_stadium_id                  =game.StadiumID
    s.away_two_point_conversion_returns    =game.AwayTwoPointConversionReturns
    s.home_two_point_conversion_returns    =game.HomeTwoPointConversionReturns
    s.point_spread                         =game.PointSpread
    s.over_under                           =game.OverUnder
    s.away_team_money_line                 =game.AwayTeamMoneyLine
    s.home_team_money_line                 =game.HomeTeamMoneyLine
    s.forecast_temp_low                    =game.ForecastTempLow
    s.forecast_temp_high                   =game.ForecastTempHigh
    s.forecast_description                 =game.ForecastDescription
    s.forecast_wind_chill                  =game.ForecastWindChill
    s.forecast_wind_speed                  =game.ForecastWindSpeed

    s.save!
  end

  def self.create_or_update_scores score
    return unless score.GameKey
    s = ::Football::Score.find_or_initialize_by( id: score.GameKey )

    Rails.logger.info "SCORE: %s %s: %s vs %s: %s " % [ score.GameKey, score.AwayTeam, score.AwayScore, score.HomeTeam, score.HomeScore ]

    s.game_key                     = score.GameKey
    s.season_type                  = score.SeasonType
    s.season                       = score.Season
    s.week                         = score.Week
    s.date                         = score.Date
    s.away_team                    = score.AwayTeam
    s.home_team                    = score.HomeTeam
    s.away_score                   = score.AwayScore
    s.home_score                   = score.HomeScore
    s.channel                      = score.Channel
    s.point_spread                 = score.PointSpread
    s.over_under                   = score.OverUnder
    s.quarter                      = score.Quarter
    s.time_remaining               = score.TimeRemaining
    s.possession                   = score.Possession
    s.down                         = score.Down
    s.distance                     = score.Distance
    s.yard_line                    = score.YardLine
    s.yard_line_territory          = score.YardLineTerritory
    s.red_zone                     = score.RedZone
    s.away_score_quarter_1         = score.AwayScoreQuarter1
    s.away_score_quarter_2         = score.AwayScoreQuarter2
    s.away_score_quarter_3         = score.AwayScoreQuarter3
    s.away_score_quarter_4         = score.AwayScoreQuarter4
    s.away_score_overtime          = score.AwayScoreOvertime
    s.home_score_quarter_1         = score.HomeScoreQuarter1
    s.home_score_quarter_2         = score.HomeScoreQuarter2
    s.home_score_quarter_3         = score.HomeScoreQuarter3
    s.home_score_quarter_4         = score.HomeScoreQuarter4
    s.home_score_overtime          = score.HomeScoreOvertime
    s.has_started                  = score.HasStarted.eql?(true)
    s.is_in_progress               = score.IsInProgress.eql?(true)
    s.is_over                      = score.IsOver.eql?(true)
    s.has_1st_quarter_started      = score.Has1stQuarterStarted.eql?(true)
    s.has_2st_quarter_started      = score.Has2stQuarterStarted.eql?(true)
    s.has_3st_quarter_started      = score.Has3stQuarterStarted.eql?(true)
    s.has_4st_quarter_started      = score.Has4stQuarterStarted.eql?(true)
    s.is_overtime                  = score.IsOvertime.eql?(true)
    s.down_and_distance            = score.DownAndDistance
    s.quarter_description          = score.QuarterDescription
    s.stadiumID                    = score.StadiumID
    s.last_updated                 = score.LastUpdated
    s.geo_lat                      = score.GeoLat
    s.geo_long                     = score.GeoLong
    s.forecast_templow             = score.ForecastTempLow
    s.forecast_temphigh            = score.ForecastTempHigh
    s.forecast_description         = score.ForecastDescription
    s.forecast_windchill           = score.ForecastWindChill
    s.forecast_windspeed           = score.ForecastWindSpeed
    s.away_team_money_line         = score.AwayTeamMoneyLine
    s.home_team_money_line         = score.HomeTeamMoneyLine
    s.canceled                     = score.Canceled.eql?(true)
    s.closed                       = score.Closed.eql?(true)

    s.save

  end


  def self.create_or_update_team team
    return unless team.TeamID

    s = ::Football::Team.find_or_initialize_by( id: team.TeamID)
    s.abbreviation                         = team.Key
    s.player_id                            = team.PlayerID
    s.city                                 = team.City
    s.name                                 = CGI.unescapeHTML team.Name
    s.conference                           = team.Conference
    s.division                             = team.Division
    s.full_name                            = team.FullName
    s.football_stadium_id                  = team.StadiumID
    s.bye_week                             = team.ByeWeek
    s.average_draft_position               = team.AverageDraftPosition
    s.average_draft_position_PPR           = team.AverageDraftPositionPPR
    s.head_coach                           = team.HeadCoach
    s.offensive_coordinator                = team.OffensiveCoordinator
    s.defensive_coordinator                = team.DefensiveCoordinator
    s.special_teams_coach                  = team.SpecialTeamsCoach
    s.offensive_scheme                     = team.OffensiveScheme
    s.defensive_scheme                     = team.DefensiveScheme
    s.upcoming_salary                      = team.UpcomingSalary
    s.upcoming_opponent                    = team.UpcomingOpponent
    s.upcoming_opponent_rank               = team.UpcomingOpponentRank
    s.upcoming_opponent_position_rank      = team.UpcomingOpponentPositionRank

    s.save

  end

  def self.create_or_update_schedule schedule
    return unless schedule.GameKey # skip bye weeks
    s = ::Football::Schedule.find_or_initialize_by( game_key: schedule.GameKey )
    s.game_key                       = schedule.GameKey
    s.season_type                    = schedule.SeasonType
    s.season                         = schedule.Season
    s.week                           = schedule.Week
    s.date_time                      = schedule.Date
    s.away_team                      = schedule.AwayTeam
    s.home_team                      = schedule.HomeTeam
    s.channel                        = schedule.Channel
    s.point_spread                   = schedule.PointSpread
    s.over_under                     = schedule.OverUnder
    s.football_stadium_id            = schedule.StadiumID
    s.geo_lat                        = schedule.GeoLat
    s.geo_long                       = schedule.GeoLong
    s.forecast_temp_low              = schedule.ForecastTempLow
    s.forecast_temp_high             = schedule.ForecastTempHigh
    s.forecast_description           = schedule.ForecastDescription
    s.forecast_wind_chill            = schedule.ForecastWindChill
    s.forecast_wind_speed            = schedule.ForecastWindSpeed
    s.away_team_money_line           = schedule.AwayTeamMoneyLine
    s.home_team_money_line           = schedule.HomeTeamMoneyLine
    s.canceled                       = schedule.Canceled.eql?(true)

    s.save

    # Football Games are created after the game starts
    create_or_update_game schedule
  end

  def self.create_or_update_timeframe timeframe
    s = ::Football::Timeframe.find_or_initialize_by( api_season: timeframe.ApiSeason, api_week: timeframe.ApiWeek )
    s.season_type                    = timeframe.SeasonType
    s.season                         = timeframe.Season
    s.week                           = timeframe.Week
    s.name                           = timeframe.Name
    s.short_name                     = timeframe.ShortName
    s.start_date                     = timeframe.StartDate
    s.end_date                       = timeframe.EndDate
    s.first_game_start               = timeframe.FirstGameStart
    s.first_game_end                 = timeframe.FirstGameEnd
    s.last_game_end                  = timeframe.LastGameEnd
    s.has_games                      = timeframe.HasGames.eql?(true)
    s.has_started                    = timeframe.HasStarted.eql?(true)
    s.has_ended                      = timeframe.HasEnded.eql?(true)
    s.has_first_game_started         = timeframe.HasFirstGameStarted.eql?(true)
    s.has_first_game_ended           = timeframe.HasFirstGameEnded.eql?(true)
    s.has_last_game_ended            = timeframe.HasLastGameEnded.eql?(true)

    s.save
  end

  def self.update_todays_box_scores
    season  = current_season
    week    = current_week

    box_scores(season: season, week: week ).each do |box|
      create_or_update_box_score box
    end
  end

  def self.create_or_update_box_score box
    return unless box
    create_or_update_game box.Game if box.Game
    create_or_update_scores box.Score if box.Score
    create_or_update_fantasy_defense_game box.AwayFantasyDefense if box.AwayFantasyDefense
    create_or_update_fantasy_defense_game box.HomeFantasyDefense if box.HomeFantasyDefense
  end

  def self.log_errors errors
    return unless errors.present?
    Rails.logger.warn "ERRORS: %d exceptions during this load   " % errors.count
    Rails.logger.warn "====================================-===="

    errors.each do |e|
      Rails.logger.warn e
    end
  end

end
