class GoalsController < ApplicationController

  def create
    current_user.stones << Stone.find(params[:stone_id])
    redirect_to stone_path(params[:stone_id])
  end

  def new
    @stone = Stone.find(params[:stone_id])
  end

  def update_queue
    @goal = Goal.where(user_id: current_user.id, stone_id: params[:stone_id]).first
    @goal.update_attribute(:queue,  params[:queue].join(", "))
    render :nothing => true
  end
end
