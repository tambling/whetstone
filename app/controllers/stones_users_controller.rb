class StonesUsersController < ApplicationController

  def create
    current_user.stones << Stone.find(params[:stone_id])
    flash[:success] = "Added This To Your List of Goals!"
    redirect_to stone_path(params[:stone_id])
  end

  def new
    @stone = Stone.find(params[:stone_id])
    render nothing: true
  end

  def update_queue
    @goal = StonesUser.where(user_id: current_user.id, stone_id: params[:stone_id]).first
    @goal.update_attribute(:queue,  params[:queue].join(", "))
    render :nothing => true
  end
end
