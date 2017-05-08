class PoolsController < ApplicationController

  def index
    @pools = Pool.all.reject {|p| !p.is_public }
  end

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

  def join
    pool = Pool.find(params[:id])
    pool.pool_memberships.build(user_id: current_user.id)
    if pool.save
      render 'show'
    else
      flash[:error] = "Oops"
      render 'show'
    end
  end

  private

  def pool_params
    params.require(:pool).permit(:owner_id, :is_public, :name)
  end
end
