class StonesUsersController < ApplicationController
  def create
    current_user.stones << Stone.find(params[:stone_id])
    current_user.goals.last.timelines << Timeline.new
    redirect_to stone_path(params[:stone_id])
  end
  
  def new
    @stone = Stone.find(params[:stone_id])
  end
end
