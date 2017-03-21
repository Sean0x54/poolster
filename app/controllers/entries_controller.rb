class EntriesController < ApplicationController
def index
  current_time = Time.now
  week = Week.where("start_time < ? and end_time > ?", current_time, current_time).take
  week.games.each_with_index do |game, index|
    entry = Entry.where(user_id: current_user.id,
      pool_id: params[:pool_id],
      game_id: game.id).first_or_create
    if entry.new_record? # Doesn't work yet
      entry.confidence_order = index
    end
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
