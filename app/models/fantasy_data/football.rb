class FantasyData::Football < FantasyData::Base
  base_url Rails.application.secrets.fantasy_data_nfl_site

  get :stadiums, "/scores/json/Stadiums"
  get :active_teams, "/scores/json/Teams"

  # get :player_details_by_available, "/stats/json/Players"
  # get :player_details_by_free_agents, "/stats/json/FreeAgents"
  # get :play_details_by_player, "/stats/json/Player/:playerid"
  # get :play_details_by_team, "/stats/json/Player/:team"

  get :schedules, "/scores/json/Schedules/:season"

  # get :bye_week, "/scores/json/Byes/:season"
  # get :news_by_player, "/scores/json/NewsByPlayerID/:playerid"
  # get :news_by_team, "/scores/json/NewsByPlayerID/:team"
  # get :news_recent, "/scores/json/News"
  # get :scores_by_season, "/scores/json/Scores/:season"
  # get :scores_by_week, "/scores/json/ScoresByWeek/:season/:week"

  # get :season_current, "/scores/json/CurrentSeason"

  # get :time_frames, "/scores/json/Timeframes/current"
  get :recent_time_frames, "/scores/json/Timeframes/recent"
  # get :upcoming_time_frames, "/scores/json/Timeframes/upcoming"
  # get :completed_time_frames, "/scores/json/Timeframes/completed"
  # get :all_time_frames, "/scores/json/Timeframes/all"

  # get :standings, "/scores/json/Standings/:season"
  # get :team_by_season, "/scores/json/Teams/:season"

  # get :box_score, "/stats/json/BoxScore/:season/:week/:hometeam"
  # get :box_scores, "/stats/json/BoxScores/:season/:week"
  # get :box_scores_active, "/stats/json/ActiveBoxScores"
  # get :box_scores_delta, "/stats/json/BoxScoresDelta/:season/:week/:minutes"
  # get :box_scores_delta_current_week, "/stats/json/RecentlyUpdatedBoxScores/:minutes"
  get :box_scores_final, "/stats/json/FinalBoxScores"
  # get :box_scores_live, "/stats/json/LiveBoxScores"

  # get :daily_fantasy_players, "/stats/json/DailyFantasyPlayers/:date"
  # get :daily_fantasy_scoring, "/stats/json/DailyFantasyPoints/:date"

  # get :fantasy_defense_season_stats, "/stats/json/FantasyDefenseBySeason/:season"
  # get :fantasy_defense_game_stats, "/stats/json/FantasyDefenseByGame/:season/:week"
  # get :fantasy_defense_game_stats_by_team, "/stats/json/FantasyDefenseByGameByTeam/:season/:week/:team"

  # get :game_stats_by_season, "/stats/json/GameStats/:season"
  # get :game_stats_by_week, "/stats/json/GameStatsByWeek/:season/:week"

  # get :injuries, "/stats/json/Injuries/:season/:week"
  # get :injuries_by_team, "/stats/json/Injuries/:season/:week/:team"

  # get :league_leaders_by_season, "/stats/json/SeasonLeagueLeaders/:season/:position/:column"
  # get :league_leaders_by_week, "/stats/json/GameLeagueLeaders/:season/:week/:position/:column"

  # get :player_game_stats_by_player, "/stats/json/PlayerGameStatsByPlayerID/:season/:week/:playerid"
  # get :player_game_stats_by_team, "/stats/json/PlayerGameStatsByTeam/:season/:week/:team"
  # get :player_game_stats_by_week, "/stats/json/PlayerGameStatsByWeek/:season/:week"
  # get :player_game_stats_by_week_delta, "/stats/json/PlayerGameStatsByWeekDelta/:season/:week/:minutes"
  # get :player_game_stats_delta, "/stats/json/PlayerGameStatsDelta/:minutes"

  # get :player_season_stats, "/stats/json/PlayerSeasonStats/:season"
  # get :player_season_stats_by_player, "/stats/json/PlayerSeasonStatsByPlayerID/:season/:playerid"
  # get :player_season_stats_by_team, "/stats/json/PlayerSeasonStatsByTeam/:season/:team"

  # get :team_game_stats, "/stats/json/TeamGameStats/:season/:week"
  # get :team_season_stats, "/stats/json/TeamSeasonStats/:season"

  # get :play_by_play, "/pbp/json/PlayByPlay/:season/:week/:hometeam"
  # get :play_by_play_delta, "/pbp/json/PlayByPlayDelta/:season/:week/:minutes"

  # get :projected_fantasy_defense_game_stats, "/projections/json/FantasyDefenseProjectionsByGame/:season/:week"
  # get :projected_fantasy_defense_season_stats, "/projections/json/FantasyDefenseProjectionsBySeaspn/:season"
  # get :projected_player_game_stats_by_player, "/projections/json/PlayerGameProjectionStatsByPlayerID/:season/:week/:playerid"
  # get :projected_player_game_stats_by_team, "/projections/json/PlayerGameProjectionStatsByTeam/:season/:week/:team"
  # get :projected_player_game_stats_by_week, "/projections/json/PlayerGameProjectionStatsByWeek/:season/:week"
  # get :projected_player_season_stats, "/projections/json/PlayerSeasonProjectionStats/:season"
  # get :projected_player_season_stats_by_player, "/projections/json/PlayerSeasonProjectionStatsByPlayerID/:season/:playerid"
  # get :projected_player_season_stats_by_team, "/projections/json/PlayerSeasonProjectionStatsByTeam/:season/:team"

  # def self.current_week
  #   time_frames.first.ApiWeek
  # end

  # def self.upcoming_week
  #   upcoming_time_frames.first.ApiWeek
  # end

  # def self.last_week
  #   completed_time_frames.first.ApiWeek
  # end

  def self.current_season
    time_frames.first.ApiSeason
  end
  #
  # def self.upcoming_season
  #   upcoming_time_frames.first.ApiSeason
  # end
  #
  # # think of this as last weeks seasons
  # def self.last_season
  #   completed_time_frames.first.ApiSeason
  # end
  #
  # def self.are_games_in_progress?
  #   _plain_request('/scores/json/AreAnyGamesInProgress', :get).eql?("true")
  # end

  # def self.create_or_update_news news
  #   return unless news.NewsID
  #   s = ::Football::News.find_or_initialize_by( id: news.NewsID )
  #   s.title                          = news.Title
  #   s.updated                        = news.Updated
  #   s.url                            = news.Url
  #   s.content                        = news.Content
  #   s.source                         = news.Source
  #   s.terms_of_use                   = news.TermsOfUse
  #   s.football_player_id             = news.PlayerID
  #   s.team                           = news.Team
  #
  #   s.save
  # end

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

  # def self.create_or_update_player player
  #   return unless player.PlayerID
  #   s = ::Football::Player.find_or_initialize_by( id: player.PlayerID )
  #   s.team                    = player.Team
  #   #s.football_team           = player.Team
  #   s.number                  = player.Number
  #   s.first_name              = player.FirstName
  #   s.last_name               = player.LastName
  #   s.position                = player.Position
  #   s.status                  = player.Status
  #   s.height                  = player.Height
  #   s.weight                  = player.Weight
  #   s.birth_date              = player.BirthDate
  #   s.college                 = player.College
  #   s.experience              = player.Experience
  #   s.fantasy_position        = player.FantasyPosition
  #   s.active                  = player.Active
  #   s.position_category       = player.PositionCategory
  #   s.name                    = player.Name
  #   s.age                     = player.Age
  #   s.experience_string       = player.ExperienceString
  #   s.birth_date_string       = player.BirthDateString
  #   s.photo_url               = CGI.unescapeHTML player.PhotoUrl
  #   s.bye_week                = player.ByeWeek
  #   s.up_coming_game_opponent = player.UpcomingGameOpponent
  #   s.up_coming_game_week     = player.UpcomingGameWeek
  #   s.short_name              = player.ShortName
  #   s.average_draft_position  = player.AverageDraftPosition
  #   s.depth_position_category = player.DepthPositionCategory
  #   s.depth_position          = player.DepthPosition
  #   s.depth_order             = player.DepthOrder
  #   s.depth_display_order     = player.DepthDisplayOrder
  #   s.current_team            = player.CurrentTeam
  #   s.college_draft_team      = player.CollegeDraftTeam
  #   s.college_draft_year      = player.CollegeDraftYear
  #   s.college_draft_round     = player.CollegeDraftRound
  #   s.college_draft_pick      = player.CollegeDraftPick
  #   s.is_undrafted_free_agent = player.IsUndraftedFreeAgent
  #   s.height_feet             = player.HeightFeet
  #   s.height_inches           = player.HeightInches
  #   s.up_coming_opponent_rank = player.UpcomingOpponentRank
  #   s.up_coming_opponent_position_rank = player.UpcomingOpponentPositionRank
  #   s.current_status          = player.CurrentStatus
  #   s.up_comming_salary       = player.UpcomingSalary
  #   s.fantasy_alarm_play_id   = player.FantasyAlarmPlayerID
  #   s.sport_radar_player_id   = player.SportRadarPlayerID
  #   s.roto_world_player_id    = player.RotoworldPlayerID
  #   s.roto_wire_play_id       = player.RotoWirePlayerID
  #   s.stats_play_id           = player.StatsPlayerID
  #   s.sports_direct_player_id = player.SportsDirectPlayerID
  #   s.xml_team_player_id      = player.XmlTeamPlayerID
  #   s.fan_duel_player_id      = player.FanDuelPlayerID
  #   s.draft_king_player_id    = player.DraftKingsPlayerID
  #   s.yahoo_player_id         = player.YahooPlayerID
  #   s.injury_status           = player.InjuryStatus
  #   s.injury_body_part        = player.InjuryBodyPart
  #   s.injury_start_date       = player.InjuryStartDate
  #   s.injury_notes            = player.InjuryNotes
  #   s.fan_duel_name           = player.FanDuelName
  #   s.draft_kings_name        = player.DraftKingsName
  #   s.yahoo_name              = player.YahooName
  #   s.fantasy_position_depth_order     = player.FantasyPositionDepthOrder
  #   s.injury_practice         = player.InjuryPractice
  #   s.injury_practice_description      = player.InjuryPracticeDescription
  #   s.declared_inactive       = player.DeclaredInactive
  #
  #   s.save!
  # end

  # def self.create_or_update_game game
  #   return unless game.GameKey
  #   s = ::Football::Game.find_or_initialize_by( game_key: game.GameKey )
  #   Rails.logger.info "GAME: %s %s vs %s" % [ game.GameKey, game.AwayTeam, game.HomeTeam ]
  #
  #   s.game_key                             =game.GameKey
  #   s.date_time                            =game.Date
  #   s.season_type                          =game.SeasonType
  #   s.season                               =game.Season
  #   s.week                                 =game.Week
  #   s.stadium                              =game.Stadium
  #   s.playing_surface                      =game.PlayingSurface
  #   s.temperature                          =game.Temperature
  #   s.humidity                             =game.Humidity
  #   s.wind_speed                           =game.WindSpeed
  #   s.away_team                            =game.AwayTeam
  #   s.home_team                            =game.HomeTeam
  #   s.away_score                           =game.AwayScore
  #   s.home_score                           =game.HomeScore
  #   s.total_score                          =game.TotalScore
  #   s.over_under                           =game.OverUnder
  #   s.point_spread                         =game.PointSpread
  #   s.away_score_quarter_1                 =game.AwayScoreQuarter1
  #   s.away_score_quarter_2                 =game.AwayScoreQuarter2
  #   s.away_score_quarter_3                 =game.AwayScoreQuarter3
  #   s.away_score_quarter_4                 =game.AwayScoreQuarter4
  #   s.away_score_overtime                  =game.AwayScoreOvertime
  #   s.home_score_quarter_1                 =game.HomeScoreQuarter1
  #   s.home_score_quarter_2                 =game.HomeScoreQuarter2
  #   s.home_score_quarter_3                 =game.HomeScoreQuarter3
  #   s.home_score_quarter_4                 =game.HomeScoreQuarter4
  #   s.home_score_overtime                  =game.HomeScoreOvertime
  #   s.away_time_of_possession              =game.AwayTimeOfPossession
  #   s.home_time_of_possession              =game.HomeTimeOfPossession
  #   s.away_first_downs                     =game.AwayFirstDowns
  #   s.home_first_downs                     =game.HomeFirstDowns
  #   s.away_first_downs_by_rushing          =game.AwayFirstDownsByRushing
  #   s.home_first_downs_by_rushing          =game.HomeFirstDownsByRushing
  #   s.away_first_downs_by_passing          =game.AwayFirstDownsByPassing
  #   s.home_first_downs_by_passing          =game.HomeFirstDownsByPassing
  #   s.away_first_downs_by_penalty          =game.AwayFirstDownsByPenalty
  #   s.home_first_downs_by_penalty          =game.HomeFirstDownsByPenalty
  #   s.away_offensive_plays                 =game.AwayOffensivePlays
  #   s.home_offensive_plays                 =game.HomeOffensivePlays
  #   s.away_offensive_yards                 =game.AwayOffensiveYards
  #   s.home_offensive_yards                 =game.HomeOffensiveYards
  #   s.away_offensive_yards_per_play        =game.AwayOffensiveYardsPerPlay
  #   s.home_offensive_yards_per_play        =game.HomeOffensiveYardsPerPlay
  #   s.away_touchdowns                      =game.AwayTouchdowns
  #   s.home_touchdowns                      =game.HomeTouchdowns
  #   s.away_rushing_attempts                =game.AwayRushingAttempts
  #   s.home_rushing_attempts                =game.HomeRushingAttempts
  #   s.away_rushing_yards                   =game.AwayRushingYards
  #   s.home_rushing_yards                   =game.HomeRushingYards
  #   s.away_rushing_yards_per_attempt       =game.AwayRushingYardsPerAttempt
  #   s.home_rushing_yards_per_attempt       =game.HomeRushingYardsPerAttempt
  #   s.away_rushing_touchdowns              =game.AwayRushingTouchdowns
  #   s.away_passing_touchdowns              =game.AwayPassingTouchdowns
  #   s.away_passing_attempts                =game.AwayPassingAttempts
  #   s.away_passing_completions             =game.AwayPassingCompletions
  #   s.away_passing_yards                   =game.AwayPassingYards
  #   s.away_passing_interceptions           =game.AwayPassingInterceptions
  #   s.away_passing_yards_per_attempt       =game.AwayPassingYardsPerAttempt
  #   s.away_passing_yards_per_completion    =game.AwayPassingYardsPerCompletion
  #   s.home_rushing_touchdowns              =game.HomeRushingTouchdowns
  #   s.home_passing_touchdowns              =game.HomePassingTouchdowns
  #   s.home_passing_attempts                =game.HomePassingAttempts
  #   s.home_passing_completions             =game.HomePassingCompletions
  #   s.home_passing_yards                   =game.HomePassingYards
  #   s.home_passing_interceptions           =game.HomePassingInterceptions
  #   s.home_passing_yards_per_attempt       =game.HomePassingYardsPerAttempt
  #   s.home_passing_yards_per_completion    =game.HomePassingYardsPerCompletion
  #   s.away_completion_percentage           =game.AwayCompletionPercentage
  #   s.away_passer_rating                   =game.AwayPasserRating
  #   s.away_third_down_attempt              =game.AwayThirdDownAttempts
  #   s.away_third_down_conversions          =game.AwayThirdDownConversions
  #   s.away_third_down_percentage           =game.AwayThirdDownPercentage
  #   s.away_fourth_down_attempts            =game.AwayFourthDownAttempts
  #   s.away_fourth_down_conversions         =game.AwayFourthDownConversions
  #   s.away_fourth_down_percentage          =game.AwayFourthDownPercentage
  #   s.home_completion_percentage           =game.HomeCompletionPercentage
  #   s.home_passer_rating                   =game.HomePasserRating
  #   s.home_third_down_attempt              =game.HomeThirdDownAttempts
  #   s.home_third_down_conversions          =game.HomeThirdDownConversions
  #   s.home_third_down_percentage           =game.HomeThirdDownPercentage
  #   s.home_fourth_down_attempts            =game.HomeFourthDownAttempts
  #   s.home_fourth_down_conversions         =game.HomeFourthDownConversions
  #   s.home_fourth_down_percentage          =game.HomeFourthDownPercentage
  #   s.away_red_zone_attempts               =game.AwayRedZoneAttempts
  #   s.away_red_zone_convesions             =game.AwayRedZoneConversions
  #   s.away_goal_to_go_attempts             =game.AwayGoalToGoAttempts
  #   s.away_goal_to_go_converstions         =game.AwayGoalToGoConversions
  #   s.away_return_yards                    =game.AwayReturnYards
  #   s.away_penalties                       =game.AwayPenalties
  #   s.away_penalty_yards                   =game.AwayPenaltyYards
  #   s.home_red_zone_attempts               =game.HomeRedZoneAttempts
  #   s.home_red_zone_convesions             =game.HomeRedZoneConversions
  #   s.home_goal_to_go_attempts             =game.HomeGoalToGoAttempts
  #   s.home_goal_to_go_converstions         =game.HomeGoalToGoConversions
  #   s.home_return_yards                    =game.HomeReturnYards
  #   s.home_penalties                       =game.HomePenalties
  #   s.home_penalty_yards                   =game.HomePenaltyYards
  #   s.away_fumbles                         =game.AwayFumbles
  #   s.away_fumbles_lost                    =game.AwayFumblesLost
  #   s.away_times_sacked                    =game.AwayTimesSacked
  #   s.away_times_sacked_yards              =game.AwayTimesSackedYards
  #   s.away_safeties                        =game.AwaySafeties
  #   s.away_punts                           =game.AwayPunts
  #   s.away_punts_yards                     =game.AwayPuntYards
  #   s.away_punt_average                    =game.AwayPuntAverage
  #   s.away_give_aways                      =game.AwayGiveaways
  #   s.away_take_aways                      =game.AwayTakeaways
  #   s.home_fumbles                         =game.HomeFumbles
  #   s.home_fumbles_lost                    =game.HomeFumblesLost
  #   s.home_times_sacked                    =game.HomeTimesSacked
  #   s.home_times_sacked_yards              =game.HomeTimesSackedYards
  #   s.home_safeties                        =game.HomeSafeties
  #   s.home_punts                           =game.HomePunts
  #   s.home_punts_yards                     =game.HomePuntYards
  #   s.home_punt_average                    =game.HomePuntAverage
  #   s.home_give_aways                      =game.HomeGiveaways
  #   s.home_take_aways                      =game.HomeTakeaways
  #   s.away_turn_over_differential          =game.AwayTurnoverDifferential
  #   s.away_kickoffs                        =game.AwayKickoffs
  #   s.away_kickoffs_in_end_zone            =game.AwayKickoffsInEndZone
  #   s.away_kickoffs_touch_backs            =game.AwayKickoffTouchbacks
  #   s.away_punts_had_blocked               =game.AwayPuntsHadBlocked
  #   s.away_punts_net_average               =game.AwayPuntNetAverage
  #   s.away_extra_point_kicking_attempts    =game.AwayExtraPointKickingAttempts
  #   s.home_turn_over_differential          =game.HomeTurnoverDifferential
  #   s.home_kickoffs                        =game.HomeKickoffs
  #   s.home_kickoffs_in_end_zone            =game.HomeKickoffsInEndZone
  #   s.home_kickoffs_touch_backs            =game.HomeKickoffTouchbacks
  #   s.home_punts_had_blocked               =game.HomePuntsHadBlocked
  #   s.home_punts_net_average               =game.HomePuntNetAverage
  #   s.home_extra_point_kicking_attempts    =game.HomeExtraPointKickingAttempts
  #   s.away_extra_point_kicking_conversions =game.AwayExtraPointKickingConversions
  #   s.away_extra_points_had_blocked        =game.AwayExtraPointsHadBlocked
  #   s.away_extra_points_passing_attempts   =game.AwayExtraPointPassingAttempts
  #   s.away_extra_points_passing_conversions=game.AwayExtraPointPassingConversions
  #   s.away_extra_point_rushing_attempts    =game.AwayExtraPointRushingAttempts
  #   s.away_extra_point_rushing_conversions =game.AwayExtraPointRushingConversions
  #   s.away_field_goal_attempts             =game.AwayFieldGoalAttempts
  #   s.home_extra_point_kicking_conversions =game.HomeExtraPointKickingConversions
  #   s.home_extra_points_had_blocked        =game.HomeExtraPointsHadBlocked
  #   s.home_extra_points_passing_attempts   =game.HomeExtraPointPassingAttempts
  #   s.home_extra_points_passing_conversions=game.HomeExtraPointPassingConversions
  #   s.home_extra_point_rushing_attempts    =game.HomeExtraPointRushingAttempts
  #   s.home_extra_point_rushing_conversions =game.HomeExtraPointRushingConversions
  #   s.home_field_goal_attempts             =game.HomeFieldGoalAttempts
  #   s.away_field_goals_made                =game.AwayFieldGoalsMade
  #   s.away_field_goals_had_blocked         =game.AwayFieldGoalsHadBlocked
  #   s.away_punt_return                     =game.AwayPuntReturns
  #   s.away_punt_return_yards               =game.AwayPuntReturnYards
  #   s.away_kick_returns                    =game.AwayKickReturns
  #   s.away_kick_return_yards               =game.AwayKickReturnYards
  #   s.away_interception_returns            =game.AwayInterceptionReturns
  #   s.away_interception_return_yards       =game.AwayInterceptionReturnYards
  #   s.home_field_goals_made                =game.HomeFieldGoalsMade
  #   s.home_field_goals_had_blocked         =game.HomeFieldGoalsHadBlocked
  #   s.home_punt_return                     =game.HomePuntReturns
  #   s.home_punt_return_yards               =game.HomePuntReturnYards
  #   s.home_kick_returns                    =game.HomeKickReturns
  #   s.home_kick_return_yards               =game.HomeKickReturnYards
  #   s.home_interception_returns            =game.HomeInterceptionReturns
  #   s.home_interception_return_yards       =game.HomeInterceptionReturnYards
  #   s.away_solo_tackles                    =game.AwaySoloTackles
  #   s.away_assisted_tackles                =game.AwayAssistedTackles
  #   s.away_quarter_back_hits               =game.AwayQuarterbackHits
  #   s.away_tackles_for_loss                =game.AwayTacklesForLoss
  #   s.away_sack                            =game.AwaySacks
  #   s.away_sacked_yards                    =game.AwaySackYards
  #   s.away_passes_defended                 =game.AwayPassesDefended
  #   s.away_fumbles_forced                  =game.AwayFumblesForced
  #   s.away_fumbles_recovered               =game.AwayFumblesRecovered
  #   s.away_fumble_return_yards             =game.AwayFumbleReturnYards
  #   s.away_fumble_return_touchtowns        =game.AwayFumbleReturnTouchdowns
  #   s.away_interceptions_return_touchdowns =game.AwayInterceptionReturnTouchdowns
  #   s.away_blocked_kicks                   =game.AwayBlockedKicks
  #   s.away_punt_return_touchdowns          =game.AwayPuntReturnTouchdowns
  #   s.away_punt_return_long                =game.AwayPuntReturnLong
  #   s.away_kick_return_touchdowns          =game.AwayKickReturnTouchdowns
  #   s.away_kick_return_long                =game.AwayKickReturnLong
  #   s.away_blocked_kick_return_yards       =game.AwayBlockedKickReturnYards
  #   s.away_blocked_kick_return_touchdowns  =game.AwayBlockedKickReturnTouchdowns
  #   s.away_field_goal_return_yards         =game.AwayFieldGoalReturnYards
  #   s.away_field_goal_return_touchdowns    =game.AwayFieldGoalReturnTouchdowns
  #   s.away_punt_net_yards                  =game.AwayPuntNetYards
  #   s.home_solo_tackles                    =game.HomeSoloTackles
  #   s.home_assisted_tackles                =game.HomeAssistedTackles
  #   s.home_quarter_back_hits               =game.HomeQuarterbackHits
  #   s.home_tackles_for_loss                =game.HomeTacklesForLoss
  #   s.home_sack                            =game.HomeSacks
  #   s.home_sacked_yards                    =game.HomeSackYards
  #   s.home_passes_defended                 =game.HomePassesDefended
  #   s.home_fumbles_forced                  =game.HomeFumblesForced
  #   s.home_fumbles_recovered               =game.HomeFumblesRecovered
  #   s.home_fumble_return_yards             =game.HomeFumbleReturnYards
  #   s.home_fumble_return_touchtowns        =game.HomeFumbleReturnTouchdowns
  #   s.home_interceptions_return_touchdowns =game.HomeInterceptionReturnTouchdowns
  #   s.home_blocked_kicks                   =game.HomeBlockedKicks
  #   s.home_punt_return_touchdowns          =game.HomePuntReturnTouchdowns
  #   s.home_punt_return_long                =game.HomePuntReturnLong
  #   s.home_kick_return_touchdowns          =game.HomeKickReturnTouchdowns
  #   s.home_kick_return_long                =game.HomeKickReturnLong
  #   s.home_blocked_kick_return_yards       =game.HomeBlockedKickReturnYards
  #   s.home_blocked_kick_return_touchdowns  =game.HomeBlockedKickReturnTouchdowns
  #   s.home_field_goal_return_yards         =game.HomeFieldGoalReturnYards
  #   s.home_field_goal_return_touchdowns    =game.HomeFieldGoalReturnTouchdowns
  #   s.home_punt_net_yards                  =game.HomePuntNetYards
  #   s.is_game_over                         =game.IsGameOver.eql?(true)
  #   s.football_stadium_id                  =game.StadiumID
  #   s.away_two_point_conversion_returns    =game.AwayTwoPointConversionReturns
  #   s.home_two_point_conversion_returns    =game.HomeTwoPointConversionReturns
  #   s.point_spread                         =game.PointSpread
  #   s.over_under                           =game.OverUnder
  #   s.away_team_money_line                 =game.AwayTeamMoneyLine
  #   s.home_team_money_line                 =game.HomeTeamMoneyLine
  #   s.forecast_temp_low                    =game.ForecastTempLow
  #   s.forecast_temp_high                   =game.ForecastTempHigh
  #   s.forecast_description                 =game.ForecastDescription
  #   s.forecast_wind_chill                  =game.ForecastWindChill
  #   s.forecast_wind_speed                  =game.ForecastWindSpeed
  #
  #   s.save!
  # end

  # def self.create_or_update_player_game player_game
  #   return unless player_game.GameKey and player_game.PlayerID
  #
  #   s = ::Football::PlayerGame.find_or_initialize_by( game_key: player_game.GameKey , football_player_id: player_game.PlayerID )
  #
  #   s.football_projected_player_game_id ||= ::Football::ProjectedPlayerGame.where( game_key: player_game.GameKey , football_player_id: player_game.PlayerID ).pluck(:id).first
  #
  #   s.fantasy_points                     =player_game.FantasyPointsFanDuel || 0.0
  #
  #   unless s.football_projected_player_game_id
  #     return unless s.fantasy_points > 0.0
  #     raise "MISSING PROJECTED_PLAYER_GAME: game_key:#{player_game.GameKey} football_player_id:#{player_game.PlayerID} #{s.fantasy_points}"
  #   end
  #
  #   Rails.logger.info "PLAYER_GAME: %s %s %s: %s" % [ player_game.GameKey, player_game.Team, player_game.Name, player_game.FantasyPoints ]
  #
  #   s.team                               =player_game.Team
  #   s.season_type                        =player_game.SeasonType
  #   s.season                             =player_game.Season
  #   s.game_date                          =player_game.GameDate
  #   s.week                               =player_game.Week
  #   s.team                               =player_game.Team
  #   s.opponent                           =player_game.Opponent
  #   s.home_or_away                       =player_game.HomeOrAway
  #   s.number                             =player_game.Number
  #   s.name                               =player_game.Name
  #   s.position                           =player_game.Position
  #   s.position_category                  =player_game.PositionCategory
  #   s.actived                            =player_game.Activated
  #   s.played                             =player_game.Played
  #   s.started                            =player_game.Started
  #   s.passing_attempts                   =player_game.PassingAttempts
  #   s.passing_completions                =player_game.PassingCompletions
  #   s.passing_yards                      =player_game.PassingYards
  #   s.passing_completion_percentage      =player_game.PassingCompletionPercentage
  #   s.passing_yards_per_attempt          =player_game.PassingYardsPerAttempt
  #   s.passing_yards_per_completion       =player_game.PassingYardsPerCompletion
  #   s.passing_touchdowns                 =player_game.PassingTouchdowns
  #   s.passing_interceptions              =player_game.PassingInterceptions
  #   s.passing_rating                     =player_game.PassingRating
  #   s.passing_long                       =player_game.PassingLong
  #   s.passing_sacks                      =player_game.PassingSacks
  #   s.passing_sack_yards                 =player_game.PassingSackYards
  #   s.rushing_attempts                   =player_game.RushingAttempts
  #   s.rushing_yards                      =player_game.RushingYards
  #   s.rushing_yards_per_attempt          =player_game.RushingYardsPerAttempt
  #   s.rushing_touchdowns                 =player_game.RushingTouchdowns
  #   s.rushing_long                       =player_game.RushingLong
  #   s.receiving_targets                  =player_game.ReceivingTargets
  #   s.receptions                         =player_game.Receptions
  #   s.receiving_yards                    =player_game.ReceivingYards
  #   s.receiving_yards_per_reception      =player_game.ReceivingYardsPerReception
  #   s.receiving_touchdowns               =player_game.ReceivingTouchdowns
  #   s.receiving_long                     =player_game.ReceivingLong
  #   s.fumbles                            =player_game.Fumbles
  #   s.fumbles_lost                       =player_game.FumblesLost
  #   s.punt_return                        =player_game.PuntReturns
  #   s.punt_return_yards                  =player_game.PuntReturnYards
  #   s.punt_return_yards_per_attempt      =player_game.PuntReturnYardsPerAttempt
  #   s.punt_return_touchdowns             =player_game.PuntReturnTouchdowns
  #   s.punt_return_long                   =player_game.PuntReturnLong
  #   s.kick_return                        =player_game.KickReturns
  #   s.kick_return_yards                  =player_game.KickReturnYards
  #   s.kick_return_yards_per_attempt      =player_game.KickReturnYardsPerAttempt
  #   s.kick_return_touchdowns             =player_game.KickReturnTouchdowns
  #   s.kick_return_long                   =player_game.KickReturnLong
  #   s.solo_tackles                       =player_game.SoloTackles
  #   s.assisted_tackles                   =player_game.AssistedTackles
  #   s.tackles_for_loss                   =player_game.TacklesForLoss
  #   s.sacks                              =player_game.Sacks
  #   s.sack_yards                         =player_game.SackYards
  #   s.quarter_back_hits                  =player_game.QuarterbackHits
  #   s.passes_defended                    =player_game.PassesDefended
  #   s.fumbles_forced                     =player_game.FumblesForced
  #   s.fumbles_recovered                  =player_game.FumblesRecovered
  #   s.fumble_return_yards                =player_game.FumbleReturnYards
  #   s.fumble_return_touchdowns           =player_game.FumbleReturnTouchdowns
  #   s.interceptions                      =player_game.Interceptions
  #   s.interception_return_yards          =player_game.InterceptionReturnYards
  #   s.interception_return_touchdowns     =player_game.InterceptionReturnTouchdowns
  #   s.blocked_kicks                      =player_game.BlockedKicks
  #   s.special_teams_solo_tackles         =player_game.SpecialTeamsSoloTackles
  #   s.special_teams_assisted_tackles     =player_game.SpecialTeamsAssistedTackles
  #   s.misc_solo_tackles                  =player_game.MiscSoloTackles
  #   s.misc_assisted_tackles              =player_game.MiscAssistedTackles
  #   s.punts                              =player_game.Punts
  #   s.punt_yards                         =player_game.PuntYards
  #   s.punt_average                       =player_game.PuntAverage
  #   s.field_goals_attempted              =player_game.FieldGoalsAttempted
  #   s.field_goals_made                   =player_game.FieldGoalsMade
  #   s.field_goals_longest_made           =player_game.FieldGoalsLongestMade
  #   s.extra_points_made                  =player_game.ExtraPointsMade
  #   s.two_point_conversion_passes        =player_game.TwoPointConversionPasses
  #   s.two_point_conversion_runs          =player_game.TwoPointConversionRuns
  #   s.two_point_conversion_receptions    =player_game.TwoPointConversionReceptions
  #   s.fantasy_points_ppr                 =player_game.FantasyPointsPPR
  #   s.reception_percentage               =player_game.ReceptionPercentage
  #   s.receiving_yards_per_target         =player_game.ReceivingYardsPerTarget
  #   s.tackles                            =player_game.Tackles
  #   s.offensive_touchdowns               =player_game.OffensiveTouchdowns
  #   s.defensive_touchdowns               =player_game.DefensiveTouchdowns
  #   s.special_teams_touchdowns           =player_game.SpecialTeamsTouchdowns
  #   s.touchdowns                         =player_game.Touchdowns
  #   s.fantasy_position                   =player_game.FantasyPosition
  #   s.field_goal_percentage              =player_game.FieldGoalPercentage
  #   s.player_game_id                     =player_game.PlayerGameID
  #   s.fumbles_own_recoveries             =player_game.FumblesOwnRecoveries
  #   s.fumbles_out_of_bounds              =player_game.FumblesOutOfBounds
  #   s.kick_return_fair_carches           =player_game.KickReturnFairCatches
  #   s.punt_return_fair_catches           =player_game.PuntReturnFairCatches
  #   s.punt_touchbacks                    =player_game.PuntTouchbacks
  #   s.punt_inside_20                     =player_game.PuntInside20
  #   s.punt_net_average                   =player_game.PuntNetAverage
  #   s.extra_points_attempted             =player_game.ExtraPointsAttempted
  #   s.blocked_kick_return_touchdowns     =player_game.BlockedKickReturnTouchdowns
  #   s.field_goal_return_touchdowns       =player_game.FieldGoalReturnTouchdowns
  #   s.safeties                           =player_game.Safeties
  #   s.field_goal_had_blocked             =player_game.FieldGoalsHadBlocked
  #   s.punts_had_blocked                  =player_game.PuntsHadBlocked
  #   s.extra_points_had_blocked           =player_game.ExtraPointsHadBlocked
  #   s.punt_long                          =player_game.PuntLong
  #   s.blocked_kick_return_yards          =player_game.BlockedKickReturnYards
  #   s.field_goal_return_yards            =player_game.FieldGoalReturnYards
  #   s.punt_net_yards                     =player_game.PuntNetYards
  #   s.special_teams_fumbles_forced       =player_game.SpecialTeamsFumblesForced
  #   s.special_teams_fumbles_recovered    =player_game.SpecialTeamsFumblesRecovered
  #   s.misc_fumbles_forced                =player_game.MiscFumblesForced
  #   s.misc_fumbles_recovered             =player_game.MiscFumblesRecovered
  #   s.short_name                         =player_game.ShortName
  #   s.playing_surface                    =player_game.PlayingSurface
  #   s.is_game_over                       =player_game.IsGameOver.eql?(true)
  #   s.safeties_allowed                   =player_game.SafetiesAllowed
  #   s.stadium                            =player_game.Stadium
  #   s.temperature                        =player_game.Temperature
  #   s.humidity                           =player_game.Humidity
  #   s.wind_speed                         =player_game.WindSpeed
  #   s.fan_duel_salary                    =player_game.FanDuelSalary
  #   s.draft_kings_salary                 =player_game.DraftKingsSalary
  #   s.fantasy_data_salary                =player_game.FantasyDataSalary
  #   s.offensive_snaps_played             =player_game.OffensiveSnapsPlayed
  #   s.defensive_snaps_played             =player_game.DefensiveSnapsPlayed
  #   s.special_teams_snaps_player         =player_game.SpecialTeamsSnapsPlayed
  #   s.offensive_team_snaps               =player_game.OffensiveTeamSnaps
  #   s.defensive_team_snaps               =player_game.DefensiveTeamSnaps
  #   s.special_teams_team_snaps           =player_game.SpecialTeamsTeamSnaps
  #   s.victiv_salary                      =player_game.VictivSalary
  #   s.two_point_conversion_returns       =player_game.TwoPointConversionReturns
  #   s.field_goals_made_0_to_19           =player_game.FieldGoalsMade0to19
  #   s.field_goals_made_20_to_29          =player_game.FieldGoalsMade20to29
  #   s.field_goals_made_30_to_39          =player_game.FieldGoalsMade30to39
  #   s.field_goals_made_40_to_49          =player_game.FieldGoalsMade40to49
  #   s.field_goals_made_50_plus           =player_game.FieldGoalsMade50Plus
  #   s.fantasy_points_draft_kings         =player_game.FantasyPointsDraftKings
  #   s.yahoo_salary                       =player_game.YahooSalary
  #   s.fantasy_points_yahoo               =player_game.FantasyPointsYahoo
  #   s.injury_status                      =player_game.InjuryStatus
  #   s.injury_body_part                   =player_game.InjuryBodyPart
  #   s.injury_start_date                  =player_game.InjuryStartDate
  #   s.injury_notes                       =player_game.InjuryNotes
  #   s.dan_duel_position                  =player_game.FanDuelPosition
  #   s.draft_kings_position               =player_game.DraftKingsPosition
  #   s.yahoo_position                     =player_game.YahooPosition
  #   s.opponent_rank                      =player_game.OpponentRank
  #   s.opponenet_position_rank            =player_game.OpponentPositionRank
  #   s.injury_practice                    =player_game.InjuryPractice
  #   s.injury_practice_description        =player_game.InjuryPracticeDescription
  #   s.declared_inactive                  =player_game.DeclaredInactive.eql?(true)
  #
  #   s.save
  # end
  #
  # def self.create_or_update_projected_player_game player_game
  #   return unless player_game.GameKey and player_game.PlayerID
  #   s = ::Football::ProjectedPlayerGame.find_or_initialize_by( game_key:player_game.GameKey,  football_player_id: player_game.PlayerID )
  #   s.season_type                     = player_game.SeasonType
  #   s.season                          = player_game.Season
  #   s.game_date                       = player_game.GameDate
  #   s.week                            = player_game.Week
  #   s.team                            = player_game.Team
  #   s.opponent                        = player_game.Opponent
  #   s.home_or_away                    = player_game.HomeOrAway
  #   s.number                          = player_game.Number
  #   s.name                            = player_game.Name
  #   s.position                        = player_game.Position
  #   s.position_category               = player_game.PositionCategory
  #   s.activated                       = player_game.Activated
  #   s.played                          = player_game.Played
  #   s.started                         = player_game.Started
  #   s.passing_attempts                = player_game.PassingAttempts
  #   s.passing_completions             = player_game.PassingCompletions
  #   s.passing_yards                   = player_game.PassingYards
  #   s.passing_completion_percentage   = player_game.PassingCompletionPercentage
  #   s.passing_yards_per_attempt       = player_game.PassingYardsPerAttempt
  #   s.passing_yards_per_completion    = player_game.PassingYardsPerCompletion
  #   s.passing_touchdowns              = player_game.PassingTouchdowns
  #   s.passing_interceptions           = player_game.PassingInterceptions
  #   s.passing_rating                  = player_game.PassingRating
  #   s.passing_long                    = player_game.PassingLong
  #   s.passing_sacks                   = player_game.PassingSacks
  #   s.passing_sackyards               = player_game.PassingSackYards
  #   s.rushing_attempts                = player_game.RushingAttempts
  #   s.rushing_yards                   = player_game.RushingYards
  #   s.rushing_yards_per_attempt       = player_game.RushingYardsPerAttempt
  #   s.rushing_touchdowns              = player_game.RushingTouchdowns
  #   s.rushing_long                    = player_game.RushingLong
  #   s.receiving_targets               = player_game.ReceivingTargets
  #   s.receptions                      = player_game.Receptions
  #   s.receiving_yards                 = player_game.ReceivingYards
  #   s.receiving_yards_per_reception   = player_game.ReceivingYardsPerReception
  #   s.receiving_touchdowns            = player_game.ReceivingTouchdowns
  #   s.receiving_long                  = player_game.ReceivingLong
  #   s.fumbles                         = player_game.Fumbles
  #   s.fumbles_lost                    = player_game.FumblesLost
  #   s.punt_returns                    = player_game.PuntReturns
  #   s.punt_return_yards               = player_game.PuntReturnYards
  #   s.punt_return_yards_per_attempt   = player_game.PuntReturnYardsPerAttempt
  #   s.punt_return_touchdowns          = player_game.PuntReturnTouchdowns
  #   s.punt_return_long                = player_game.PuntReturnLong
  #   s.kick_returns                    = player_game.KickReturns
  #   s.kick_return_yards               = player_game.KickReturnYards
  #   s.kick_return_yards_per_attempt   = player_game.KickReturnYardsPerAttempt
  #   s.kick_return_touchdowns          = player_game.KickReturnTouchdowns
  #   s.kick_return_long                = player_game.KickReturnLong
  #   s.solo_tackles                    = player_game.SoloTackles
  #   s.assisted_tackles                = player_game.AssistedTackles
  #   s.tackles_for_loss                = player_game.TacklesForLoss
  #   s.sacks                           = player_game.Sacks
  #   s.sack_yards                      = player_game.SackYards
  #   s.quarter_back_hits               = player_game.QuarterbackHits
  #   s.passes_defended                 = player_game.PassesDefended
  #   s.fumbles_forced                  = player_game.FumblesForced
  #   s.fumbles_recovered               = player_game.FumblesRecovered
  #   s.fumble_return_yards             = player_game.FumbleReturnYards
  #   s.fumble_return_touchdowns        = player_game.FumbleReturnTouchdowns
  #   s.interceptions                   = player_game.Interceptions
  #   s.interception_return_yards       = player_game.InterceptionReturnYards
  #   s.interception_return_touchdowns  = player_game.InterceptionReturnTouchdowns
  #   s.blocked_kicks                   = player_game.BlockedKicks
  #   s.special_teams_solo_tackles      = player_game.SpecialTeamsSoloTackles
  #   s.special_teams_assisted_tackles  = player_game.SpecialTeamsAssistedTackles
  #   s.misc_solo_tackles               = player_game.MiscSoloTackles
  #   s.misc_assisted_tackles           = player_game.MiscAssistedTackles
  #   s.punts                           = player_game.Punts
  #   s.punt_yards                      = player_game.PuntYards
  #   s.punt_average                    = player_game.PuntAverage
  #   s.field_goals_attempted           = player_game.FieldGoalsAttempted
  #   s.field_goals_made                = player_game.FieldGoalsMade
  #   s.field_goals_longest_made        = player_game.FieldGoalsLongestMade
  #   s.extrapointsmade                 = player_game.ExtraPointsMade
  #   s.two_point_conversion_passes     = player_game.TwoPointConversionPasses
  #   s.two_point_conversion_runs       = player_game.TwoPointConversionRuns
  #   s.two_point_conversion_receptions = player_game.TwoPointConversionReceptions
  #   s.fantasy_points_ppr              = player_game.FantasyPointsPPR
  #   s.reception_percentage            = player_game.ReceptionPercentage
  #   s.receiving_yards_per_target      = player_game.ReceivingYardsPerTarget
  #   s.tackles                         = player_game.Tackles
  #   s.offensive_touchdowns            = player_game.OffensiveTouchdowns
  #   s.defensive_touchdowns            = player_game.DefensiveTouchdowns
  #   s.special_teams_touchdowns        = player_game.SpecialTeamsTouchdowns
  #   s.touchdowns                      = player_game.Touchdowns
  #   s.fantasy_position                = player_game.FantasyPosition
  #   s.field_goal_percentage           = player_game.FieldGoalPercentage
  #   s.player_game_id                  = player_game.PlayerGameID
  #   s.fumbles_own_recoveries          = player_game.FumblesOwnRecoveries
  #   s.fumbles_out_of_bounds           = player_game.FumblesOutOfBounds
  #   s.kick_return_fair_catches        = player_game.KickReturnFairCatches
  #   s.punt_return_fair_catches        = player_game.PuntReturnFairCatches
  #   s.punt_touch_backs                = player_game.PuntTouchbacks
  #   s.punt_inside_20                  = player_game.PuntInside20
  #   s.punt_net_average                = player_game.PuntNetAverage
  #   s.extra_points_attempted          = player_game.ExtraPointsAttempted
  #   s.blocked_kick_return_touchdowns  = player_game.BlockedKickReturnTouchdowns
  #   s.field_goal_return_touchdowns    = player_game.FieldGoalReturnTouchdowns
  #   s.safeties                        = player_game.Safeties
  #   s.field_goals_had_blocked         = player_game.FieldGoalsHadBlocked
  #   s.punts_had_blocked               = player_game.PuntsHadBlocked
  #   s.extra_points_had_blocked        = player_game.ExtraPointsHadBlocked
  #   s.punt_long                       = player_game.PuntLong
  #   s.blocked_kick_return_yards       = player_game.BlockedKickReturnYards
  #   s.field_goal_return_yards         = player_game.FieldGoalReturnYards
  #   s.punt_net_yards                  = player_game.PuntNetYards
  #   s.special_teams_fumbles_forced    = player_game.SpecialTeamsFumblesForced
  #   s.special_teams_fumbles_recovered = player_game.SpecialTeamsFumblesRecovered
  #   s.misc_fumbles_forced             = player_game.MiscFumblesForced
  #   s.misc_fumbles_recovered          = player_game.MiscFumblesRecovered
  #   s.short_name                      = player_game.ShortName
  #   s.playing_surface                 = player_game.PlayingSurface
  #   s.is_game_over                    = player_game.IsGameOver.eql?(true)
  #   s.safeties_allowed                = player_game.SafetiesAllowed
  #   s.stadium                         = player_game.Stadium
  #   s.temperature                     = player_game.Temperature
  #   s.humidity                        = player_game.Humidity
  #   s.wind_speed                      = player_game.WindSpeed
  #   s.salary                          = player_game.FanDuelSalary || player_game.FantasyDataSalary || 0
  #   s.fan_duel_salary                 = player_game.FanDuelSalary || 0
  #   s.draftkings_salary               = player_game.DraftKingsSalary
  #   s.fantasydata_salary              = player_game.FantasyDataSalary
  #   s.offensive_snaps_played          = player_game.OffensiveSnapsPlayed
  #   s.defensive_snaps_played          = player_game.DefensiveSnapsPlayed
  #   s.special_teams_snaps_played      = player_game.SpecialTeamsSnapsPlayed
  #   s.offensive_team_snaps            = player_game.OffensiveTeamSnaps
  #   s.defensive_team_snaps            = player_game.DefensiveTeamSnaps
  #   s.special_teams_team_snaps        = player_game.SpecialTeamsTeamSnaps
  #   s.victiv_salary                   = player_game.VictivSalary
  #   s.two_point_conversion_returns    = player_game.TwoPointConversionReturns
  #   s.fantasy_points                  = player_game.FantasyPointsFanDuel || 0.0
  #   s.field_goals_made_0_to_19        = player_game.FieldGoalsMade0to19
  #   s.field_goals_made_20_to_29       = player_game.FieldGoalsMade20to29
  #   s.field_goals_made_30_to_39       = player_game.FieldGoalsMade30to39
  #   s.field_goals_made_40_to_49       = player_game.FieldGoalsMade40to49
  #   s.field_goals_made_50_plus        = player_game.FieldGoalsMade50Plus
  #   s.fantasy_points_draftkings       = player_game.FantasyPointsDraftKings
  #   s.yahoo_salary                    = player_game.YahooSalary
  #   s.fantasy_points_yahoo            = player_game.FantasyPointsYahoo
  #   s.injury_status                   = player_game.InjuryStatus
  #   s.injury_body_part                = player_game.InjuryBodyPart
  #   s.injury_start_date               = player_game.InjuryStartDate
  #   s.injury_notes                    = player_game.InjuryNotes
  #   s.fanduel_position                = player_game.FanDuelPosition
  #   s.draftkings_position             = player_game.DraftKingsPosition
  #   s.yahoo_position                  = player_game.YahooPosition
  #   s.opponent_rank                   = player_game.OpponentRank
  #   s.opponent_position_rank          = player_game.OpponentPositionRank
  #   s.injury_practice                 = player_game.InjuryPractice
  #   s.injury_practice_description     = player_game.InjuryPracticeDescription
  #   s.declared_inactive               = player_game.DeclaredInactive
  #
  #   s.save!
  # end
  #
  # def self.create_or_update_player_season player_season
  #   s = ::Football::PlayerSeason.find_or_initialize_by( id: player_season.PlayerID )
  #
  #   s.season_type                     = player_season.SeasonType
  #   s.season                          = player_season.Season
  #   s.team                            = player_season.Team
  #   s.number                          = player_season.Number
  #   s.name                            = player_season.Name
  #   s.position                        = player_season.Position
  #   s.position_category               = player_season.PositionCategory
  #   s.activated                       = player_season.Activated
  #   s.played                          = player_season.Played
  #   s.started                         = player_season.Started
  #   s.passing_attempts                = player_season.PassingAttempts
  #   s.passing_completions             = player_season.PassingCompletions
  #   s.passing_yards                   = player_season.PassingYards
  #   s.passing_completion_percentage   = player_season.PassingCompletionPercentage
  #   s.passing_yards_per_attempt       = player_season.PassingYardsPerAttempt
  #   s.passing_yards_per_completion    = player_season.PassingYardsPerCompletion
  #   s.passing_touchdowns              = player_season.PassingTouchdowns
  #   s.passing_interceptions           = player_season.PassingInterceptions
  #   s.passing_rating                  = player_season.PassingRating
  #   s.passing_long                    = player_season.PassingLong
  #   s.passing_sacks                   = player_season.PassingSacks
  #   s.passing_sacks_yards             = player_season.PassingSackYards
  #   s.rushing_attempts                = player_season.RushingAttempts
  #   s.rushing_yards                   = player_season.RushingYards
  #   s.rushing_yards_per_attempt       = player_season.RushingYardsPerAttempt
  #   s.rushing_touchdowns              = player_season.RushingTouchdowns
  #   s.rushing_long                    = player_season.RushingLong
  #   s.receiving_targets               = player_season.ReceivingTargets
  #   s.receptions                      = player_season.Receptions
  #   s.receiving_yards                 = player_season.ReceivingYards
  #   s.receiving_yards_per_reception   = player_season.ReceivingYardsPerReception
  #   s.receiving_touchdowns            = player_season.ReceivingTouchdowns
  #   s.receiving_long                  = player_season.ReceivingLong
  #   s.fumbles                         = player_season.Fumbles
  #   s.fumbles_lost                    = player_season.FumblesLost
  #   s.punt_returns                    = player_season.PuntReturns
  #   s.punt_return_yards               = player_season.PuntReturnYards
  #   s.punt_return_yards_per_attempt   = player_season.PuntReturnYardsPerAttempt
  #   s.punt_returns_touchdowns         = player_season.PuntReturnTouchdowns
  #   s.punt_returns_long               = player_season.PuntReturnLong
  #   s.kick_returns                    = player_season.KickReturns
  #   s.kick_returns_yards              = player_season.KickReturnYards
  #   s.kick_returns_yards_per_attempt  = player_season.KickReturnYardsPerAttempt
  #   s.kick_return_touchdowns          = player_season.KickReturnTouchdowns
  #   s.kick_return_long                = player_season.KickReturnLong
  #   s.solo_tackles                    = player_season.SoloTackles
  #   s.assisted_tackles                = player_season.AssistedTackles
  #   s.tackles_for_loss                = player_season.TacklesForLoss
  #   s.sacks                           = player_season.Sacks
  #   s.sack_yards                      = player_season.SackYards
  #   s.quarter_back_hits               = player_season.QuarterbackHits
  #   s.passes_defended                 = player_season.PassesDefended
  #   s.fumbles_forced                  = player_season.FumblesForced
  #   s.fumbles_recovered               = player_season.FumblesRecovered
  #   s.fumble_return_yards             = player_season.FumbleReturnYards
  #   s.fumble_return_touchdowns        = player_season.FumbleReturnTouchdowns
  #   s.interceptions                   = player_season.Interceptions
  #   s.interception_return_yards       = player_season.InterceptionReturnYards
  #   s.interception_return_touchdowns  = player_season.InterceptionReturnTouchdowns
  #   s.blocked_kicks                   = player_season.BlockedKicks
  #   s.special_teams_solo_tackles      = player_season.SpecialTeamsSoloTackles
  #   s.special_team_assisted_tackles   = player_season.SpecialTeamsAssistedTackles
  #   s.misc_solo_tackles               = player_season.MiscSoloTackles
  #   s.misc_assisted_tackles           = player_season.MiscAssistedTackles
  #   s.punts                           = player_season.Punts
  #   s.punt_yards                      = player_season.PuntYards
  #   s.punt_average                    = player_season.PuntAverage
  #   s.field_goals_attempted           = player_season.FieldGoalsAttempted
  #   s.field_goals_made                = player_season.FieldGoalsMade
  #   s.field_goals_longest_made        = player_season.FieldGoalsLongestMade
  #   s.extra_points_made               = player_season.ExtraPointsMade
  #   s.two_point_conversion_passes     = player_season.TwoPointConversionPasses
  #   s.two_point_converstion_runs      = player_season.TwoPointConversionRuns
  #   s.two_point_converstion_receptions= player_season.TwoPointConversionReceptions
  #   s.fantasy_points_PPR              = player_season.FantasyPointsPPR
  #   s.reception_percentage            = player_season.ReceptionPercentage
  #   s.receiving_yards_per_target      = player_season.ReceivingYardsPerTarget
  #   s.tackles                         = player_season.Tackles
  #   s.offensive_touchdowns            = player_season.OffensiveTouchdowns
  #   s.defensive_touchdowns            = player_season.DefensiveTouchdowns
  #   s.special_teams_touchdowns        = player_season.SpecialTeamsTouchdowns
  #   s.touchdowns                      = player_season.Touchdowns
  #   s.fantasy_position                = player_season.FantasyPosition
  #   s.field_goal_percentage           = player_season.FieldGoalPercentage
  #   s.player_season_id                = player_season.PlayerSeasonID
  #   s.fumbles_own_recoveries          = player_season.FumblesOwnRecoveries
  #   s.fumbles_out_of_bounds           = player_season.FumblesOutOfBounds
  #   s.kick_return_fair_catches        = player_season.KickReturnFairCatches
  #   s.punt_return_fair_catches        = player_season.PuntReturnFairCatches
  #   s.punt_touchbacks                 = player_season.PuntTouchbacks
  #   s.punt_inside_20                  = player_season.PuntInside20
  #   s.punt_net_average                = player_season.PuntNetAverage
  #   s.extra_points_attempted          = player_season.ExtraPointsAttempted
  #   s.blocked_kick_return_touchdowns  = player_season.BlockedKickReturnTouchdowns
  #   s.field_goal_return_touchdowns    = player_season.FieldGoalReturnTouchdowns
  #   s.safeties                        = player_season.Safeties
  #   s.field_goals_had_blocked         = player_season.FieldGoalsHadBlocked
  #   s.punts_had_blocked               = player_season.PuntsHadBlocked
  #   s.extra_points_had_blocked        = player_season.ExtraPointsHadBlocked
  #   s.punt_long                       = player_season.PuntLong
  #   s.blocked_kick_return_yards       = player_season.BlockedKickReturnYards
  #   s.field_goal_return_yards         = player_season.FieldGoalReturnYards
  #   s.punt_net_yards                  = player_season.PuntNetYards
  #   s.special_teams_fumbles_forced    = player_season.SpecialTeamsFumblesForced
  #   s.special_teams_fumbles_recovered = player_season.SpecialTeamsFumblesRecovered
  #   s.misc_fumbles_forced             = player_season.MiscFumblesForced
  #   s.misc_fumbles_recovered          = player_season.MiscFumblesRecovered
  #   s.short_name                      = player_season.ShortName
  #   s.safeties_allowed                = player_season.SafetiesAllowed
  #   s.temperature                     = player_season.Temperature
  #   s.humidity                        = player_season.Humidity
  #   s.wind_speed                      = player_season.WindSpeed
  #   s.offensive_snaps_played          = player_season.OffensiveSnapsPlayed
  #   s.defensive_snaps_played          = player_season.DefensiveSnapsPlayed
  #   s.special_teams_snaps_played      = player_season.SpecialTeamsSnapsPlayed
  #   s.offensive_team_snaps            = player_season.OffensiveTeamSnaps
  #   s.defensive_team_snaps            = player_season.DefensiveTeamSnaps
  #   s.special_teams_team_snaps        = player_season.SpecialTeamsTeamSnaps
  #   s.auction_value                   = player_season.AuctionValue
  #   s.auction_value_ppr               = player_season.AuctionValuePPR
  #   s.two_point_conversion_returns    = player_season.TwoPointConversionReturns
  #   s.fantasy_points                  = player_season.FantasyPointsFanDuel
  #   s.field_goals_made_0_to_19        = player_season.FieldGoalsMade0to19
  #   s.field_goals_made_20_to_29       = player_season.FieldGoalsMade20to29
  #   s.field_goals_made_30_to_39       = player_season.FieldGoalsMade30to39
  #   s.field_goals_made_40_to_49       = player_season.FieldGoalsMade40to49
  #   s.field_goals_made_50_plus        = player_season.FieldGoalsMade50Plus
  #   s.fantasy_points_draftkings       = player_season.FantasyPointsDraftKings
  #   s.fantasy_points_yahoo            = player_season.FantasyPointsYahoo
  #
  #   s.save
  # end

  # def self.create_or_update_scores score
  #   return unless score.GameKey
  #   s = ::Football::Score.find_or_initialize_by( id: score.GameKey )
  #
  #   Rails.logger.info "SCORE: %s %s: %s vs %s: %s " % [ score.GameKey, score.AwayTeam, score.AwayScore, score.HomeTeam, score.HomeScore ]
  #
  #   s.game_key                     = score.GameKey
  #   s.season_type                  = score.SeasonType
  #   s.season                       = score.Season
  #   s.week                         = score.Week
  #   s.date                         = score.Date
  #   s.away_team                    = score.AwayTeam
  #   s.home_team                    = score.HomeTeam
  #   s.away_score                   = score.AwayScore
  #   s.home_score                   = score.HomeScore
  #   s.channel                      = score.Channel
  #   s.point_spread                 = score.PointSpread
  #   s.over_under                   = score.OverUnder
  #   s.quarter                      = score.Quarter
  #   s.time_remaining               = score.TimeRemaining
  #   s.possession                   = score.Possession
  #   s.down                         = score.Down
  #   s.distance                     = score.Distance
  #   s.yard_line                    = score.YardLine
  #   s.yard_line_territory          = score.YardLineTerritory
  #   s.red_zone                     = score.RedZone
  #   s.away_score_quarter_1         = score.AwayScoreQuarter1
  #   s.away_score_quarter_2         = score.AwayScoreQuarter2
  #   s.away_score_quarter_3         = score.AwayScoreQuarter3
  #   s.away_score_quarter_4         = score.AwayScoreQuarter4
  #   s.away_score_overtime          = score.AwayScoreOvertime
  #   s.home_score_quarter_1         = score.HomeScoreQuarter1
  #   s.home_score_quarter_2         = score.HomeScoreQuarter2
  #   s.home_score_quarter_3         = score.HomeScoreQuarter3
  #   s.home_score_quarter_4         = score.HomeScoreQuarter4
  #   s.home_score_overtime          = score.HomeScoreOvertime
  #   s.has_started                  = score.HasStarted.eql?(true)
  #   s.is_in_progress               = score.IsInProgress.eql?(true)
  #   s.is_over                      = score.IsOver.eql?(true)
  #   s.has_1st_quarter_started      = score.Has1stQuarterStarted.eql?(true)
  #   s.has_2st_quarter_started      = score.Has2stQuarterStarted.eql?(true)
  #   s.has_3st_quarter_started      = score.Has3stQuarterStarted.eql?(true)
  #   s.has_4st_quarter_started      = score.Has4stQuarterStarted.eql?(true)
  #   s.is_overtime                  = score.IsOvertime.eql?(true)
  #   s.down_and_distance            = score.DownAndDistance
  #   s.quarter_description          = score.QuarterDescription
  #   s.stadiumID                    = score.StadiumID
  #   s.last_updated                 = score.LastUpdated
  #   s.geo_lat                      = score.GeoLat
  #   s.geo_long                     = score.GeoLong
  #   s.forecast_templow             = score.ForecastTempLow
  #   s.forecast_temphigh            = score.ForecastTempHigh
  #   s.forecast_description         = score.ForecastDescription
  #   s.forecast_windchill           = score.ForecastWindChill
  #   s.forecast_windspeed           = score.ForecastWindSpeed
  #   s.away_team_money_line         = score.AwayTeamMoneyLine
  #   s.home_team_money_line         = score.HomeTeamMoneyLine
  #   s.canceled                     = score.Canceled.eql?(true)
  #   s.closed                       = score.Closed.eql?(true)
  #
  #   s.save
  #
  # end

  # def self.create_or_update_fantasy_defense_game defense_game
  #   return unless defense_game.GameKey and defense_game.PlayerID
  #
  #   s = ::Football::FantasyDefenseGame.find_or_initialize_by( game_key: defense_game.GameKey , player_id: defense_game.PlayerID )
  #
  #   s.football_fantasy_defense_game_projection_id ||= ::Football::FantasyDefenseGameProjection.where( game_key: defense_game.GameKey , player_id: defense_game.PlayerID ).pluck(:id).first
  #
  #   # no projection .. no go
  #   raise "MISSING FANTASY_DEFENSE_GAME_PROJECTION: game_key:#{defense_game.GameKey} football_player_id:#{defense_game.PlayerID}" unless s.football_fantasy_defense_game_projection_id
  #
  #   Rails.logger.info "DEFENSE: %s %s: %s" % [ defense_game.GameKey, defense_game.Team, defense_game.FantasyPoints ]
  #
  #
  #   s.season_type                         =defense_game.SeasonType
  #   s.season                              =defense_game.Season
  #   s.week                                =defense_game.Week
  #   s.date                                =defense_game.Date
  #   s.team                                =defense_game.Team
  #   s.opponent                            =defense_game.Opponent
  #   s.points_allowed                      =defense_game.PointsAllowed
  #   s.touchdowns_scored                   =defense_game.TouchdownsScored
  #   s.solo_tackles                        =defense_game.SoloTackles
  #   s.assisted_tackles                    =defense_game.AssistedTackles
  #   s.sacks                               =defense_game.Sacks
  #   s.sack_yards                          =defense_game.SackYards
  #   s.passes_defended                     =defense_game.PassesDefended
  #   s.fumbles_forced                      =defense_game.FumblesForced
  #   s.fumbles_recovered                   =defense_game.FumblesRecovered
  #   s.fumble_return_yards                 =defense_game.FumbleReturnYards
  #   s.fumble_return_touchdowns            =defense_game.FumbleReturnTouchdowns
  #   s.interceptions                       =defense_game.Interceptions
  #   s.interception_return_yards           =defense_game.InterceptionReturnYards
  #   s.interception_return_touchdowns      =defense_game.InterceptionReturnTouchdowns
  #   s.blocked_kicks                       =defense_game.BlockedKicks
  #   s.safeties                            =defense_game.Safeties
  #   s.punt_return                         =defense_game.PuntReturns
  #   s.punt_return_yards                   =defense_game.PuntReturnYards
  #   s.punt_return_touchdowns              =defense_game.PuntReturnTouchdowns
  #   s.punt_return_long                    =defense_game.PuntReturnLong
  #   s.kick_return                         =defense_game.KickReturns
  #   s.kick_return_yards                   =defense_game.KickReturnYards
  #   s.kick_return_touchdowns              =defense_game.KickReturnTouchdowns
  #   s.kick_return_long                    =defense_game.KickReturnLong
  #   s.blocked_kick_return_touchdowns      =defense_game.BlockedKickReturnTouchdowns
  #   s.field_goal_return_touchdowns        =defense_game.FieldGoalReturnTouchdowns
  #   s.fantasy_points_allowed              =defense_game.FantasyPointsAllowed
  #   s.quarterback_fantasy_points_allowed  =defense_game.QuarterbackFantasyPointsAllowed
  #   s.runningback_fantasy_points_allowed  =defense_game.RunningbackFantasyPointsAllowed
  #   s.wide_receiver_fantasy_points_allowed=defense_game.WideReceiverFantasyPointsAllowed
  #   s.tight_end_fantasy_points_allowed    =defense_game.TightEndFantasyPointsAllowed
  #   s.kicker_fantasy_points_allowed       =defense_game.KickerFantasyPointsAllowed
  #   s.blocked_kick_return_yards           =defense_game.BlockedKickReturnYards
  #   s.field_goal_return_yards             =defense_game.FieldGoalReturnYards
  #   s.quarterback_hits                    =defense_game.QuarterbackHits
  #   s.tackles_for_loss                    =defense_game.TacklesForLoss
  #   s.defensive_touchdowns                =defense_game.DefensiveTouchdowns
  #   s.special_teams_touchdowns            =defense_game.SpecialTeamsTouchdowns
  #   s.isGameOver                          =defense_game.IsGameOver.eql?(true)
  #   s.fantasy_points                      =defense_game.FantasyPoints
  #   s.stadium                             =defense_game.Stadium
  #   s.temperature                         =defense_game.Temperature
  #   s.humidity                            =defense_game.Humidity
  #   s.wind_speed                          =defense_game.WindSpeed
  #   s.thriddown_attempts                  =defense_game.ThirdDownAttempts
  #   s.thriddown_conversions               =defense_game.ThirdDownConversions
  #   s.fourthdown_attempts                 =defense_game.FourthDownAttempts
  #   s.fourthdown_conversions              =defense_game.FourthDownConversions
  #   s.points_allowed_by_defense_special_teams=defense_game.PointsAllowedByDefenseSpecialTeams
  #   s.salary                              =defense_game.FanDuelSalary || defense_game.FantasyDataSalary
  #   s.fan_duel_salary                     =defense_game.FanDuelSalary
  #   s.draft_kings_salary                  =defense_game.DraftKingsSalary
  #   s.fantasy_data_salary                 =defense_game.FantasyDataSalary
  #   s.victiv_salary                       =defense_game.VictivSalary
  #   s.two_point_conversion_returns        =defense_game.TwoPointConversionReturns
  #   s.fantasy_points_fan_duel             =defense_game.FantasyPointsFanDuel
  #   s.fantasy_points_draft_kings          =defense_game.FantasyPointsDraftKings
  #   s.offensive_yards_allowed             =defense_game.OffensiveYardsAllowed
  #   s.yahoo_salary                        =defense_game.YahooSalary
  #   s.fantasy_points_yahoo                =defense_game.FantasyPointsYahoo
  #   s.home_or_away                        =defense_game.HomeOrAway
  #   s.opponent_rank                       =defense_game.OpponentRank
  #   s.opponent_position_rank              =defense_game.OpponentPositionRank
  #
  #   s.save
  #
  #
  #   # Mirror updates to defense with player_game version
  #   defense_game.Activated        = 1
  #   defense_game.GameDate         = defense_game.Date
  #   defense_game.Position         = "D"
  #   defense_game.PositionCategory = "DEF"
  #   defense_game.Name             = ::Football::Team.find_by( player_id: defense_game.PlayerID ).full_name
  #
  #   create_or_update_player_game  defense_game
  # end
  #
  # def self.create_or_update_fantasy_defense_season defense_season
  #   s = ::Football::FantasyDefenseSeason.find_or_initialize_by( id: defense_season.id )
  #
  #   s.season_type                         =defense_season.SeasonType
  #   s.season                              =defense_season.Season
  #   s.team                                =defense_season.Team
  #   s.points_allowed                      =defense_season.PointsAllowed
  #   s.touchdowns_scored                   =defense_season.TouchdownsScored
  #   s.solo_tackles                        =defense_season.SoloTackles
  #   s.assisted_tackles                    =defense_season.AssistedTackles
  #   s.sacks                               =defense_season.Sacks
  #   s.sack_yards                          =defense_season.SackYards
  #   s.passes_defended                     =defense_season.PassesDefended
  #   s.fumbles_forced                      =defense_season.FumblesForced
  #   s.fumbles_recovered                   =defense_season.FumblesRecovered
  #   s.fumble_return_yards                 =defense_season.FumbleReturnYards
  #   s.fumble_return_touchdowns            =defense_season.FumbleReturnTouchdowns
  #   s.interceptions                       =defense_season.Interceptions
  #   s.interception_return_yards           =defense_season.InterceptionReturnYards
  #   s.interception_return_touchdowns      =defense_season.InterceptionReturnTouchdowns
  #   s.blocked_kicks                       =defense_season.BlockedKicks
  #   s.safeties                            =defense_season.Safeties
  #   s.punt_returns                        =defense_season.PuntReturns
  #   s.punt_return_yards                   =defense_season.PuntReturnYards
  #   s.punt_return_touchdowns              =defense_season.PuntReturnTouchdowns
  #   s.punt_return_long                    =defense_season.PuntReturnLong
  #   s.kick_returns                        =defense_season.KickReturns
  #   s.kick_return_yards                   =defense_season.KickReturnYards
  #   s.kick_return_touchdowns              =defense_season.KickReturnTouchdowns
  #   s.kick_return_long                    =defense_season.KickReturnLong
  #   s.blocked_kick_return_touchdowns      =defense_season.BlockedKickReturnTouchdowns
  #   s.field_foal_return_touchdowns        =defense_season.FieldGoalReturnTouchdowns
  #   s.fantasy_points_allowed              =defense_season.FantasyPointsAllowed
  #   s.quarterback_fantasy_points_allowed  =defense_season.QuarterbackFantasyPointsAllowed
  #   s.runningback_fantasy_points_allowed  =defense_season.RunningbackFantasyPointsAllowed
  #   s.wide_receive_fantasy_points_allowed =defense_season.WideReceiverFantasyPointsAllowed
  #   s.tight_end_fantasy_points_allowed    =defense_season.TightEndFantasyPointsAllowed
  #   s.kicker_fantasy_points_allowed       =defense_season.KickerFantasyPointsAllowed
  #   s.games                               =defense_season.Games
  #   s.blocked_kick_return_yards           =defense_season.BlockedKickReturnYards
  #   s.field_goal_return_yards             =defense_season.FieldGoalReturnYards
  #   s.quarterback_hits                    =defense_season.QuarterbackHits
  #   s.tackles_for_loss                    =defense_season.TacklesForLoss
  #   s.defensive_touchdowns                =defense_season.DefensiveTouchdowns
  #   s.special_teams_touchdowns            =defense_season.SpecialTeamsTouchdowns
  #   s.fantasy_points                      =defense_season.FantasyPoints
  #   s.temperature                         =defense_season.Temperature
  #   s.humidity                            =defense_season.Humidity
  #   s.wind_speed                          =defense_season.WindSpeed
  #   s.thirddown_attempts                  =defense_season.ThirdDownAttempts
  #   s.thirddown_conversions               =defense_season.ThirdDownConversions
  #   s.fourthdown_attempts                 =defense_season.FourthDownAttempts
  #   s.fourthdown_conversions              =defense_season.FourthDownConversions
  #   s.points_allowed_by_defense_special_teams=defense_season.PointsAllowedByDefenseSpecialTeams
  #   s.auction_value                       =defense_season.AuctionValue
  #   s.auction_value_ppr                   =defense_season.AuctionValuePPR
  #   s.two_point_conversion_returns        =defense_season.TwoPointConversionReturns
  #   s.fantasy_points_fan_duel             =defense_season.FantasyPointsFanDuel
  #   s.fantasy_points_draft_kings          =defense_season.FantasyPointsDraftKings
  #   s.offensive_yards_allowed             =defense_season.OffensiveYardsAllowed
  #   s.fantasy_points_yahoo                =defense_season.FantasyPointsYahoo
  #   s.average_draft_position              =defense_season.AverageDraftPosition
  #   s.average_draft_position_ppr          =defense_season.AverageDraftPositionPPR
  #
  #   s.save
  # end
  #
  # def self.create_or_update_fantasy_defense_game_projection defense_game
  #   return unless defense_game.GameKey and defense_game.PlayerID
  #
  #   s = ::Football::FantasyDefenseGameProjection.find_or_initialize_by( game_key:defense_game.GameKey, player_id:defense_game.PlayerID )
  #
  #   Rails.logger.info "DEFENSE PROJECTION: %s %s: %s" % [ defense_game.GameKey, defense_game.Team, defense_game.FantasyPoints ]
  #
  #   s.season_type                          =defense_game.SeasonType
  #   s.season                               =defense_game.Season
  #   s.week                                 =defense_game.Week
  #   s.date                                 =defense_game.Date
  #   s.team                                 =defense_game.Team
  #   s.opponent                             =defense_game.Opponent
  #   s.points_allowed                       =defense_game.PointsAllowed
  #   s.touchdowns_scored                    =defense_game.TouchdownsScored
  #   s.solo_tackles                         =defense_game.SoloTackles
  #   s.assisted_tackles                     =defense_game.AssistedTackles
  #   s.sacks                                =defense_game.Sacks
  #   s.sack_yards                           =defense_game.SackYards
  #   s.passes_defended                      =defense_game.PassesDefended
  #   s.fumbles_forced                       =defense_game.FumblesForced
  #   s.fumbles_recovered                    =defense_game.FumblesRecovered
  #   s.fumble_return_yards                  =defense_game.FumbleReturnYards
  #   s.fumble_return_touchdowns             =defense_game.FumbleReturnTouchdowns
  #   s.interceptions                        =defense_game.Interceptions
  #   s.interception_return_yards            =defense_game.InterceptionReturnYards
  #   s.interception_return_touchdowns       =defense_game.InterceptionReturnTouchdowns
  #   s.blocked_kicks                        =defense_game.BlockedKicks
  #   s.safeties                             =defense_game.Safeties
  #   s.punt_returns                         =defense_game.PuntReturns
  #   s.punt_return_yards                    =defense_game.PuntReturnYards
  #   s.punt_return_touchdowns               =defense_game.PuntReturnTouchdowns
  #   s.punt_return_long                     =defense_game.PuntReturnLong
  #   s.kick_returns                         =defense_game.KickReturns
  #   s.kick_return_yards                    =defense_game.KickReturnYards
  #   s.kick_return_touchdowns               =defense_game.KickReturnTouchdowns
  #   s.kick_return_long                     =defense_game.KickReturnLong
  #   s.blocked_kick_return_touchdowns       =defense_game.BlockedKickReturnTouchdowns
  #   s.field_goal_return_touchdowns         =defense_game.FieldGoalReturnTouchdowns
  #   s.fantasy_points_allowed               =defense_game.FantasyPointsAllowed
  #   s.quarterback_fantasy_points_allowed   =defense_game.QuarterbackFantasyPointsAllowed
  #   s.runningback_fantasy_points_allowed   =defense_game.RunningbackFantasyPointsAllowed
  #   s.widereceiver_fantasy_points_allowed  =defense_game.WideReceiverFantasyPointsAllowed
  #   s.tightend_fantasy_points_allowed      =defense_game.TightEndFantasyPointsAllowed
  #   s.kicker_fantasy_points_allowed        =defense_game.KickerFantasyPointsAllowed
  #   s.blocked_kick_return_yards            =defense_game.BlockedKickReturnYards
  #   s.field_goal_return_yards              =defense_game.FieldGoalReturnYards
  #   s.quarterback_hits                     =defense_game.QuarterbackHits
  #   s.tackles_for_loss                     =defense_game.TacklesForLoss
  #   s.defensive_touchdowns                 =defense_game.DefensiveTouchdowns
  #   s.special_teams_touchdowns             =defense_game.SpecialTeamsTouchdowns
  #   s.is_gameover                          =defense_game.IsGameOver.eql?(true)
  #   s.fantasy_points                       =defense_game.FantasyPoints
  #   s.stadium                              =defense_game.Stadium
  #   s.temperature                          =defense_game.Temperature
  #   s.humidity                             =defense_game.Humidity
  #   s.wind_speed                           =defense_game.WindSpeed
  #   s.thirddown_attempts                   =defense_game.ThirdDownAttempts
  #   s.thirddown_conversions                =defense_game.ThirdDownConversions
  #   s.fourthdown_attempts                  =defense_game.FourthDownAttempts
  #   s.fourthdown_conversions               =defense_game.FourthDownConversions
  #   s.points_allowed_by_defense_special_teams=defense_game.PointsAllowedByDefenseSpecialTeams
  #   s.salary                               =defense_game.FanDuelSalary || defense_game.FantasyDataSalary
  #   s.fan_duel_salary                      =defense_game.FanDuelSalary
  #   s.draft_kings_salary                   =defense_game.DraftKingsSalary
  #   s.fantasy_data_salary                  =defense_game.FantasyDataSalary
  #   s.victiv_salary                        =defense_game.VictivSalary
  #   s.two_point_conversion_returns         =defense_game.TwoPointConversionReturns
  #   s.fantasy_points_fan_duel              =defense_game.FantasyPointsFanDuel
  #   s.fantasy_points_draft_kings           =defense_game.FantasyPointsDraftKings
  #   s.offensive_yards_allowed              =defense_game.OffensiveYardsAllowed
  #   s.yahoo_salary                         =defense_game.YahooSalary
  #   s.fantasy_points_yahoo                 =defense_game.FantasyPointsYahoo
  #   s.home_or_away                         =defense_game.HomeOrAway
  #   s.opponent_rank                        =defense_game.OpponentRank
  #   s.opponenet_position_rank              =defense_game.OpponentPositionRank
  #
  #   s.save
  #
  #   # Mirror updates to defense with player_game version
  #   defense_game.Activated        = 1
  #   defense_game.GameDate         = defense_game.Date
  #   defense_game.Position         = "D"
  #   defense_game.PositionCategory = "DEF"
  #   defense_game.Name             = ::Football::Team.find_by( player_id: defense_game.PlayerID ).full_name
  #
  #   create_or_update_projected_player_game  defense_game
  # end

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

    # Teams are DEF players

    # p = ::Football::Player.find_or_initialize_by( id: team.PlayerID )
    #
    # p.team              = s.name
    # p.first_name        = s.city
    # p.last_name         = s.name
    # p.position          = "D"
    # p.active            = true
    # p.photo_url         = nil
    # p.bye_week          = s.bye_week
    # p.status            = 'Active'
    # p.position_category = 'DEF'
    # p.short_name        = "#{p.first_name.first}. #{p.last_name}"
    #
    # p.save
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

    # Football Games are created after the game starts,
    # follow Baseball and create them before the game.
    create_or_update_game schedule
  end

  # def self.create_or_update_timeframe timeframe
  #   s = ::Football::Timeframe.find_or_initialize_by( api_season: timeframe.ApiSeason, api_week: timeframe.ApiWeek )
  #   s.season_type                    = timeframe.SeasonType
  #   s.season                         = timeframe.Season
  #   s.week                           = timeframe.Week
  #   s.name                           = timeframe.Name
  #   s.short_name                     = timeframe.ShortName
  #   s.start_date                     = timeframe.StartDate
  #   s.end_date                       = timeframe.EndDate
  #   s.first_game_start               = timeframe.FirstGameStart
  #   s.first_game_end                 = timeframe.FirstGameEnd
  #   s.last_game_end                  = timeframe.LastGameEnd
  #   s.has_games                      = timeframe.HasGames.eql?(true)
  #   s.has_started                    = timeframe.HasStarted.eql?(true)
  #   s.has_ended                      = timeframe.HasEnded.eql?(true)
  #   s.has_first_game_started         = timeframe.HasFirstGameStarted.eql?(true)
  #   s.has_first_game_ended           = timeframe.HasFirstGameEnded.eql?(true)
  #   s.has_last_game_ended            = timeframe.HasLastGameEnded.eql?(true)
  #
  #   s.save
  # end

  def self.update_todays_box_scores
    season  = current_season
    week    = current_week

    box_scores(season: season, week: week ).each do |box|
      create_or_update_box_score box
    end
  end

  # def self.update_todays_player_games
  #   season  = current_season
  #   week    = current_week
  #
  #   errors=[]
  #   counter =0
  #
  #   player_game_stats_by_week(season: season, week: week ).each do |pg|
  #     begin
  #       create_or_update_player_game pg
  #       counter += 1
  #     rescue StandardError => e
  #         errors << e.message
  #     end
  #   end
  #
  #   Rails.logger.info "Updated %d Player Games" % counter
  #   self.log_errors errors
  # end
  #
  # def self.create_or_update_box_score box
  #   return unless box
  #   create_or_update_game box.Game if box.Game
  #   create_or_update_scores box.Score if box.Score
  #   create_or_update_fantasy_defense_game box.AwayFantasyDefense if box.AwayFantasyDefense
  #   create_or_update_fantasy_defense_game box.HomeFantasyDefense if box.HomeFantasyDefense
  # end

  # def self.play_ball!
  #   Rails.logger.info "PLAY_BALL: Started"
  #
  #   #
  #   # modeled after http://fantasydata.com/resources/implementation-guide.aspx
  #   #
  #
  #   begin
  #
  #     Rails.logger.info "PLAY_BALL"
  #
  #     # loop until we have a game in progress
  #     until are_games_in_progress?
  #       Rails.logger.info "PLAY_BALL: No Games in progress, sleeping"
  #       sleep 60
  #     end
  #
  #     # Occasionally make a full pull, in case we have a gap in the delta pulls below
  #     Rails.logger.info "PLAY_BALL: Updating today's box scores"
  #     update_todays_box_scores
  #     Rails.logger.info "PLAY_BALL: Updating today's player games"
  #     update_todays_player_games
  #
  #     60.times do
  #       Rails.logger.info "PLAY_BALL: Updating recent box scores"
  #       box_scores_delta_current_week(minutes: 2).each do |box|
  #         begin
  #           create_or_update_box_score box
  #         rescue StandardError => e
  #           Rails.logger.warn "PLAY_BALL: CAUGHT: [%s]" % e.message
  #         end
  #       end
  #
  #       player_game_stats_delta(minutes: 2).each do |pg|
  #         begin
  #           create_or_update_player_game pg
  #         rescue StandardError => e
  #           Rails.logger.warn "PLAY_BALL: CAUGHT: [%s]" % e.message
  #         end
  #       end
  #
  #       Rails.logger.info "PLAY_BALL: Sleeping"
  #       sleep 15
  #     end
  #
  #     #
  #     # Update any of the day's games to wrap up the very last game
  #     # as well as to catch any games that we may have missed
  #     #
  #
  #     Rails.logger.info "PLAY_BALL: Updating the day's box scores"
  #     update_todays_box_scores
  #     Rails.logger.info "PLAY_BALL: Updating today's player games"
  #     update_todays_player_games
  #
  #     Rails.logger.info "PLAY_BALL: Sleeping"
  #     sleep 30
  #
  #   rescue StandardError => e
  #     Rails.logger.warn "PLAY_BALL: CAUGHT: [%s]" % e.message
  #     Rails.logger.info "PLAY_BALL: taking a timeout after rescuing an exception"
  #     sleep 30
  #   end until false
  # end

  def self.log_errors errors
    return unless errors.present?
    Rails.logger.warn "ERRORS: %d exceptions during this load   " % errors.count
    Rails.logger.warn "====================================-===="

    errors.each do |e|
      Rails.logger.warn e
    end
  end

end
