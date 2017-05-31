class EntriesController < ApplicationController
def index
  current_time = Time.now
  week = Football::Timeframe.where("start_date > ? and end_date > ? and api_season = ? and week > 0", current_time, current_time, "2017PRE").take
  @games = Football::Game.where(week: week.week, season_type: week.season_type)
  @games.each do |game|
    entry = Entry.where(
      user_id: current_user.id,
      pool_id: params[:pool_id],
      game_id: game.id).first_or_create
  end
  @entries = current_user.entries.where(pool_id: params[:pool_id])

end

def show
  @entry = Entry.find(params[:id])
end

def new
  @entry = Entry.new()
end

def create
  @entry = Entry.create(entry_params)
  if current_user
    @entry.save
  else
    redirect_to :new
  end
end

private

def entry_params
  params.require(:entry).permit(:team_id, :game_id )
end

end
