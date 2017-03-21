namespace :fantasy_data do
	desc "tasks for syncing with Fantasy Data"
  namespace :football do
    namespace :sync do

      # desc "run all syncs for Fantasy Data"
      # task :all => :environment do
      #   Rake::Task["utils:set_logger"].execute
      #   Rake::Task["fantasy_data:football:sync:stadiums"].execute
      #   Rake::Task["fantasy_data:football:sync:teams"].execute
      #   Rake::Task["fantasy_data:football:sync:players"].execute
      #   Rake::Task["fantasy_data:football:sync:timeframes"].invoke
      #   Rake::Task["fantasy_data:football:sync:schedules"].invoke
      #   Rake::Task["fantasy_data:football:sync:news"].execute
      #   Rake::Task["fantasy_data:football:sync:box_scores_final"].execute
      #   Rake::Task["fantasy_data:football:sync:upcoming_projected"].invoke
      #   Rake::Task["fantasy_data:football:sync:current_stats"].invoke
      #   Rake::Task["fantasy_data:football:sync:current_season"].execute
      # end

      desc "sync stadiums from Fantasy Data"
      task :stadiums  => :environment do
        counter = 0
        errors = []
        FantasyData::Football.stadiums.each do |stadium|
          begin
            FantasyData::Football.create_or_update_stadium stadium
            counter += 1
          rescue StandardError => e
            errors << e.message
          end
        end
        Rails.logger.info "Updated %d Stadiums" % counter
        log_errors errors
      end

      desc "sync teams from Fantasy Data"
      task :teams => :environment do
        counter = 0
        errors = []
        FantasyData::Football.active_teams.each do |team|
          begin
            FantasyData::Football.create_or_update_team team
            counter += 1
          rescue StandardError => e
            errors << e.message
          end
        end
        Rails.logger.info "Updated %d Teams" % counter
        log_errors errors
      end

      desc "sync time frames from Fantasy Data"
      task :timeframes  => :environment do
        Rake::Task["utils:set_logger"].execute
        current_season = 2016 #FantasyData::Football.current_season.to_i
        FantasyData::Football.recent_time_frames.each do |timeframe|
          next unless timeframe.Season.eql?(current_season)
          FantasyData::Football.create_or_update_timeframe timeframe
        end
      end



      # desc "add latest news feed"
      # task :news  => :environment do | task, args |
      #   counter = 0
      #   errors = []
      #   FantasyData::Football.news_recent.each do |news|
      #     begin
      #       FantasyData::Football.create_or_update_news news
      #       counter += 1
      #     rescue StadardError => e
      #       errors << e.message
      #     end
      #   end
      #   Rails.logger.info "Updated %d News Items" % counter
      #   log_errors errors
      # end

      # desc "sync players from Fantasy Data"
      # task :players  => :environment do
      #   Rake::Task["utils:set_logger"].execute
      #
      #   counter = 0
      #   errors  = []
      #
      #   FantasyData::Football.player_details_by_available.each do | player |
      #     begin
      #       FantasyData::Football.create_or_update_player player
      #       counter += 1
      #     rescue StandardError => e
      #       errors << e.message
      #     end
      #   end
      #
      #   FantasyData::Football.player_details_by_free_agents.each do | player |
      #     begin
      #       FantasyData::Football.create_or_update_player player
      #       counter += 1
      #     rescue StandardError => e
      #       errors << e.message
      #     end
      #   end
      #
      #   Rails.logger.info "Updated %d Players" % counter
      #   log_errors errors
      # end

      # desc "sync schedules from Fantasy Data"
      # task :schedules, [:season]  => :environment do | task, args |
      #   Rake::Task["utils:set_logger"].execute
      #   Rake::Task["fantasy_data:football:sync:stadiums"].execute
      #   args.with_defaults(season: FantasyData::Football.current_season.to_i )
      #
      #   counter = 0
      #   errors = []
      #
      #   %w(REG POST).each do | season_suffix |
      #     FantasyData::Football.schedules(season: args.season.to_s + season_suffix).each do |schedule|
      #       begin
      #         FantasyData::Football.create_or_update_schedule schedule
      #         counter += 1
      #       rescue StandardError => e
      #         errors << e.message
      #       end
      #     end
      #   end
      #
      #   Rails.logger.info "Updated %d Schedules" % counter
      #   log_errors errors
      # end

    #   desc "sync scores from Fantasy Data"
    #   task :scores_by_week, [:season, :week]  => :environment do | task, args |
    #     Rake::Task["utils:set_logger"].execute
    #     args.with_defaults(season: FantasyData::Football.current_season)
    #     args.with_defaults(week: FantasyData::Football.current_week)
     #
    #     errors = []
    #     counter = 0
     #
    #     FantasyData::Football.scores_by_week(season: args.season, week: args.week).each do |score|
    #       begin
    #         FantasyData::Football.create_or_update_scores score
    #         counter +=1
    #       rescue StandardError => e
    #         errors << e.message
    #       end
    #     end
     #
    #     Rails.logger.info "Updated %d Scores" % counter
    #     log_errors errors
    #  end

      desc "sync box scores final from Fantasy Data"
      task :box_scores_final  => :environment do
        Rake::Task["utils:set_logger"].execute

        errors = []
        counter = 0

        FantasyData::Football.box_scores_final.each do |box|
          begin
            FantasyData::Football.create_or_update_box_score box
            counter += 1
          rescue StandardError => e
            errors << e.message
          end
        end

        Rails.logger.info "Updated %d Box Scores" % counter
        log_errors errors
      end

      # desc "sync box scores today from Fantasy Data"
      # task :box_scores_by_week, [:season, :week ]  => :environment do | task, args |
      #   Rake::Task["utils:set_logger"].execute
      #   args.with_defaults(season: FantasyData::Football.current_season)
      #   args.with_defaults(week: FantasyData::Football.current_week)
      #   Rails.logger.info "Updating Box Scores for Season: %s Week: %s" % [ args.season, args.week ]
      #
      #   errors = []
      #   counter = 0
      #
      #   FantasyData::Football.box_scores(season: args.season, week: args.week).each do |box|
      #     begin
      #       FantasyData::Football.create_or_update_box_score box
      #       counter += 1
      #     rescue StandardError => e
      #       errors << e.message
      #     end
      #   end
      #
      #   Rails.logger.info "Updated %d Box Scores" % counter
      #   log_errors errors
      # end


      # desc "sync player_games from Fantasy Data"
      # task :player_game_stats_by_week, [:season, :week]  => :environment do | task, args |
      #   Rake::Task["utils:set_logger"].execute
      #   args.with_defaults(season: FantasyData::Football.current_season)
      #   args.with_defaults(week: FantasyData::Football.current_week)
      #   Rails.logger.info "Updating Player Games for Season: %s Week: %s" % [ args.season, args.week ]
      #
      #   errors = []
      #   counter = 0
      #
      #   FantasyData::Football.player_game_stats_by_week(season: args.season, week: args.week ).each do |player_game|
      #     begin
      #       FantasyData::Football.create_or_update_player_game player_game
      #       counter += 1
      #     rescue Exception => e
      #       errors << e.message
      #     end
      #   end
      #
      #   Rails.logger.info "Updated %d Player Games for Season: %s Week: %s" % [ counter, args.season, args.week ]
      #   log_errors errors
      # end

    #   desc "sync defense_games from Fantasy Data"
    #   task :defense_game_stats_by_week, [:season, :week]  => :environment do | task, args |
    #     Rake::Task["utils:set_logger"].execute
    #     args.with_defaults(season: FantasyData::Football.current_season)
    #     args.with_defaults(week: FantasyData::Football.current_week)
    #     Rails.logger.info "Updating Defense Games for Season: %s Week: %s" % [ args.season, args.week ]
    #
    #     errors = []
    #     counter = 0
    #
    #     FantasyData::Football.fantasy_defense_game_stats(season: args.season, week: args.week ).each do |defense_game|
    #       begin
    #         FantasyData::Football.create_or_update_fantasy_defense_game defense_game
    #         counter +=1
    #       rescue Exception => e
    #         errors << e.message
    #       end
    #     end
    #
    #     Rails.logger.info "Updated %d Defense Games for Season: %s Week: %s" % [ counter, args.season, args.week ]
    #     log_errors errors
    #   end
    #
    #   desc "sync player_seasons from Fantasy Data"
    #   task :player_season_stats, [:season]  => :environment do | task, args |
    #     Rake::Task["utils:set_logger"].execute
    #     args.with_defaults( season: FantasyData::Football.current_season.to_i)
    #     Rails.logger.info "Updating Player Seasons for %s:" % args.season
    #
    #     counter = 0
    #     errors = []
    #     FantasyData::Football.player_season_stats(season: args.season).each do | player_season |
    #       begin
    #         FantasyData::Football.create_or_update_player_season player_season
    #         counter += 1
    #       rescue ActiveRecord::InvalidForeignKey => e
    #         errors << e.message
    #       end
    #     end
    #     Rails.logger.info "Updated %d Player Seasons" % counter
    #     log_errors errors
    #   end
    #
    #   desc "sync defense_seasons from Fantasy Data"
    #   task :defense_season_stats, [:season]  => :environment do | task, args |
    #     Rake::Task["utils:set_logger"].execute
    #     args.with_defaults( season: FantasyData::Football.current_season)
    #     Rails.logger.info "Updating Defense Seasons for Season: %s" % [ args.season ]
    #
    #     errors =[]
    #     counter = 0
    #
    #     FantasyData::Football.fantasy_defense_season_stats(season: args.season).each do | defense_season |
    #       begin
    #         FantasyData::Football.create_or_update_fantasy_defense_season defense_season
    #         counter += 1
    #       rescue ActiveRecord::InvalidForeignKey => e
    #         errors << e.message
    #       end
    #     end
    #
    #     Rails.logger.info "Updated %d Defense Seasons" % counter
    #     log_errors errors
    #   end
    #
    #
    #   desc "sync projected_player_games stats by week from Fantasy Data"
    #   task :projected_player_game_stats_by_week, [:season, :week]  => :environment do | task, args |
    #     Rake::Task["utils:set_logger"].execute
    #     args.with_defaults(season: FantasyData::Football.current_season)
    #     args.with_defaults(week: FantasyData::Football.current_week)
    #     Rails.logger.info "Updating Player Games Stats for Season: %s Week: %s" % [ args.season, args.week ]
    #
    #     errors = []
    #     counter = 0
    #
    #     FantasyData::Football.projected_player_game_stats_by_week(season: args.season, week: args.week).each do |player_game|
    #       begin
    #         FantasyData::Football.create_or_update_projected_player_game player_game
    #         counter +=1
    #       rescue Stadard => e
    #         errors << e.message
    #       end
    #     end
    #
    #     Rails.logger.info "Updated %d Player Seasons" % counter
    #     log_errors errors
    #   end
    #
    #   desc "sync projected stats for upcoming week"
    #   task :upcoming_projected => :environment do | task, args |
    #
    #     season  = FantasyData::Football.upcoming_season
    #     week    = FantasyData::Football.upcoming_week
    #
    #     Rake::Task["fantasy_data:football:sync:projected_player_game_stats_by_week"].invoke(season, week)
    #     Rake::Task["fantasy_data:football:sync:projected_defense_game_stats_by_week"].invoke(season, week)
    #   end
    #
    #   desc "sync stats for current week"
    #   task :current_stats => :environment do | task, args |
    #
    #     season  = FantasyData::Football.current_season
    #     week    = FantasyData::Football.current_week
    #
    #     Rake::Task["fantasy_data:football:sync:player_game_stats_by_week"].invoke(season, week)
    #     Rake::Task["fantasy_data:football:sync:defense_game_stats_by_week"].invoke(season, week)
    #   end
    #
    #   desc "sync stats for current season"
    #   task :current_season => :environment do | task, args |
    #
    #     season  = FantasyData::Football.current_season
    #
    #     Rake::Task["fantasy_data:football:sync:player_season_stats"].invoke(season)
    #     Rake::Task["fantasy_data:football:sync:defense_season_stats"].invoke(season)
    #   end
    #
    #
    #   desc "sync defense_games_project from Fantasy Data"
    #   task :projected_defense_game_stats_by_week, [:season, :week]  => :environment do | task, args |
    #     Rake::Task["utils:set_logger"].execute
    #     args.with_defaults(season: FantasyData::Football.current_season)
    #     args.with_defaults(week: FantasyData::Football.current_week)
    #     errors = []
    #     counter = 0
    #
    #     FantasyData::Football.projected_fantasy_defense_game_stats(season: args.season, week: args.week ).each do |defense_game|
    #       begin
    #         FantasyData::Football.create_or_update_fantasy_defense_game_projection defense_game
    #         counter +=1
    #       rescue Exception => e
    #         errors << e.message
    #       end
    #     end
    #
    #     Rails.logger.info "Updated %d Fantasy Defense Game Projections" % counter
    #     log_errors errors
    #   end
    # end
end
    # desc "setup for today's games. Sync games, pull projected players, sets sets game_day to today to be run multiple times in the morning."
    # task :start_day  => :environment do | task, args |
    #   Rake::Task["utils:set_logger"].execute
    #   begin
    #     season = FantasyData::Football.current_season
    #     week   = FantasyData::Football.current_week
    #
    #     Rails.logger.info "FOOTBALL START_DAY: Season: %s Week: %s" % [ season, week ]
    #     Rake::Task["fantasy_data:football:sync:stadiums"].execute
    #     Rake::Task["fantasy_data:football:sync:teams"].execute
    #     Rake::Task["fantasy_data:football:sync:upcoming_projected"].execute
    #     Rake::Task["fantasy_data:football:autocontest:create"].invoke if Time.now.wday.eql?(2)
    #     Rake::Task["userstats:calculate"].invoke("Football")
    #     Rake::Task["fantasy_data:football:sync:current_stats"].invoke
    #     Rake::Task["fantasy_data:football:sync:current_season"].execute
    #   rescue StandardError => e
    #     Rails.logger.error "START_DAY: [%s]" % e.message
    #     raise
    #   end
    # end

    # desc "continual poll and update fantasy_data"
    # task :play_ball  => :environment do | task, args |
    #   # when running under upstart without sync, logging can be lost between start and stops.
    #   # Added so we can monitor updates to cron.log
    #   $stdout.sync = true
    #   Rake::Task["utils:set_logger"].execute
    #   FantasyData::Football.play_ball!
    # end

    # namespace :autocontest do
    #   desc "System generated contests for testing purposes"
    #   task :create  => :environment do
    #     Rails.logger.info "FOOTBALL create contests."
    #     system_user =  User.find_by(email:'draftclash@system.com')
    #
    #     block_for_sport = Time.now.beginning_of_week
    #
    #     s = Sport.find_by(league_name: "NFL")
    #
    #     time_blocks = Contest.new(sport: s).auto_game_start_time_blocks(block_for_sport, s.sport_name)
    #
    #     time_blocks.each do |block, time|
    #       # th = thursday 830
    #       # s1 = sunday 1pm
    #       # s4 = sunday 4pm
    #       # s8 = sunday 830
    #       time_of_day =
    #         if block.to_s == 'th'
    #           'Thursday Blitz'
    #         elsif block.to_s == 's1'
    #           'Sunday Kickoff'
    #         elsif block.to_s == 's4'
    #           'Sunday Rush'
    #         elsif block.to_s == 's8'
    #           'Primetime Clash'
    #         else
    #       end
    #
    #       contest = system_user.contests.new(sport: s)
    #       contest.title = "#{time_of_day}"
    #       contest.contest_type = 'league'
    #       contest.start_date = time
    #       contest.start_time = time
    #
    #       next if Contest.exists?( user_id: contest.user_id, title: contest.title, start_date: contest.start_date, start_time: contest.start_time, sport: s)
    #
    #       Rails.logger.info "Creating contest on %s at %s title: %s" % [ contest.start_date, contest.start_time, contest.title ]
    #       contest.save(validate: false)
    #     end
    #   end
    # end

    # namespace :cron do
    #   desc "football hourly tasks"
    #   task :hourly  => :environment do | task, args |
    #     begin
    #       Rake::Task["utils:set_logger"].execute
    #       Rake::Task["fantasy_data:football:sync:schedules"].execute
    #       Rake::Task["fantasy_data:football:sync:box_scores_final"].execute
    #       Rake::Task["fantasy_data:football:sync:news"].execute
    #       Rake::Task["fantasy_data:football:sync:current_stats"].execute
    #       Rake::Task["fantasy_data:football:sync:upcoming_projected"].invoke
    #       Rake::Task["fantasy_data:football:sync:current_season"].invoke
    #       Rake::Task["fantasy_data:football:sync:players"].execute
    #     rescue StandardError => e
    #       Rails.logger.error "CRON:HOURLY [%s]" % e.message
    #       raise
    #     end
    #   end
    # end
  end
end

def log_errors errors
  return unless errors.present?
  Rails.logger.warn "ERRORS: %d exceptions during this load   " % errors.count
  Rails.logger.warn "====================================-===="

  errors.each do |e|
    Rails.logger.warn e
  end
end
