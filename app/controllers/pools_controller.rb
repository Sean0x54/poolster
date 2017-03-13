class PoolsController < ApplicationController
  def new
    @pool = Pool.new(owner_id: current_user.id)
  end

  def create
    @pool = Pool.create(pool_params)
    if @pool.save
      redirect_to root_path
    else
      flash[:error] = "You need to fill out the form"
      redirect_to :new
    end
  end
  def show
    @pool = Pool.find(params[:id])
    @users = @pool.members
  end


  private

  def pool_params
    params.require(:pool).permit(:owner_id, :is_public, :name)
  end
end
