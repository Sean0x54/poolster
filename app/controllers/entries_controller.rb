class EntriesController < ApplicationController
def index
  current_time = Time.now
  @week = Football::Game.where(week: 1)
  @week.each_with_index do |game, index|

    # if entry.new_record? # Doesn't work yet
    #   entry.confidence_order = index
    # end
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
