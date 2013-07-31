class DiscussionsController < ApplicationController
  def index
    @stone = Stone.find(params[:stone_id])
    @goal = current_user.goals.where(stone_id: @stone.id).first if user_signed_in?
    @discussion = Discussion.new
    render :json => render_to_string('index', layout: false , locals: {stone: @stone, user: current_user, discussion: @discusssion, goal: @goal}).to_json
  end

  def show
    @stone = Stone.find(params[:stone_id])
    @discussion = Discussion.find(params[:id])
    @comment = Comment.new
    render :json => render_to_string('show', layout: false).to_json
  end

  def create
    @stone = Stone.find(params[:stone_id])
    @user = current_user
    @discussion = Discussion.create(params[:discussion])
    render :json => render_to_string(@discussion, layout: false).to_json
  end
end
