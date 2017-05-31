namespace :fantasy_data do
	desc "tasks for syncing with Fantasy Data"
  namespace :football do
    namespace :sync do

      desc "run all syncs for Fantasy Data"
      task :all => :environment do

        Rake::Task["fantasy_data:football:sync:stadiums"].execute
        Rake::Task["fantasy_data:football:sync:teams"].execute
        Rake::Task["fantasy_data:football:sync:timeframes"].invoke
        Rake::Task["fantasy_data:football:sync:schedules"].invoke
        Rake::Task["fantasy_data:football:sync:news"].execute
        Rake::Task["fantasy_data:football:sync:box_scores_final"].execute
        Rake::Task["fantasy_data:football:sync:current_season"].execute
      end

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
        #
        current_season = FantasyData::Football.current_season.to_i
        FantasyData::Football.recent_time_frames.each do |timeframe|
          next unless timeframe.Season.eql?(current_season)
          FantasyData::Football.create_or_update_timeframe timeframe
        end
      end



      desc "add latest news feed"
      task :news  => :environment do | task, args |
        counter = 0
        errors = []
        FantasyData::Football.news_recent.each do |news|
          begin
            FantasyData::Football.create_or_update_news news
            counter += 1
          rescue StadardError => e
            errors << e.message
          end
        end
        Rails.logger.info "Updated %d News Items" % counter
        log_errors errors
      end

      desc "sync schedules from Fantasy Data"
      task :schedules, [:season]  => :environment do | task, args |

        Rake::Task["fantasy_data:football:sync:stadiums"].execute
        args.with_defaults(season: FantasyData::Football.current_season.to_i )

        counter = 0
        errors = []

        %w(PRE REG POST).each do | season_suffix |
          FantasyData::Football.schedules(season: args.season.to_s + season_suffix).each do |schedule|
            begin
              FantasyData::Football.create_or_update_schedule schedule
              counter += 1
            rescue StandardError => e
              errors << e.message
            end
          end
        end

        Rails.logger.info "Updated %d Schedules" % counter
        log_errors errors
      end

      desc "sync scores from Fantasy Data"
      task :scores_by_week, [:season, :week]  => :environment do | task, args |

        args.with_defaults(season: FantasyData::Football.current_season)
        args.with_defaults(week: FantasyData::Football.current_week)

        errors = []
        counter = 0

        FantasyData::Football.scores_by_week(season: args.season, week: args.week).each do |score|
          begin
            FantasyData::Football.create_or_update_scores score
            counter +=1
          rescue StandardError => e
            errors << e.message
          end
        end

        Rails.logger.info "Updated %d Scores" % counter
        log_errors errors
      end

      desc "sync box scores final from Fantasy Data"
      task :box_scores_final  => :environment do


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

      desc "sync box scores today from Fantasy Data"
      task :box_scores_by_week, [:season, :week ]  => :environment do | task, args |

        args.with_defaults(season: FantasyData::Football.current_season)
        args.with_defaults(week: FantasyData::Football.current_week)
        Rails.logger.info "Updating Box Scores for Season: %s Week: %s" % [ args.season, args.week ]

        errors = []
        counter = 0

        FantasyData::Football.box_scores(season: args.season, week: args.week).each do |box|
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

		end

    namespace :cron do
      desc "football hourly tasks"
      task :hourly  => :environment do | task, args |
        begin

          Rake::Task["fantasy_data:football:sync:schedules"].execute
          Rake::Task["fantasy_data:football:sync:box_scores_final"].execute
          Rake::Task["fantasy_data:football:sync:news"].execute
          Rake::Task["fantasy_data:football:sync:current_season"].invoke
        rescue StandardError => e
          Rails.logger.error "CRON:HOURLY [%s]" % e.message
          raise
        end
      end
    end

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
