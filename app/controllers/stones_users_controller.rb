class StonesUsersController < ApplicationController

  def create
    current_user.stones << Stone.find(params[:stone_id])
    flash[:success] = "Added This To Your List of Goals!"
    redirect_to stone_path(params[:stone_id])
  end

  def new
    @stone = Stone.find(params[:stone_id])
  end

  def update_queue
    @goal = StonesUser.where(user: current_user, stone: params[:stone]).first
    # TODO: you are failing silently
    @goal.update_attribute(:queue,  params[:queue].join(", "))
    render :nothing => true
  end
end
