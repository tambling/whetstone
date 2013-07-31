class DiscussionsController < ApplicationController
  before_filter :load_stone

  def index
    @discussion = Discussion.new
    render :json => render_to_string('index', layout: false , locals: {stone: @stone, user: current_user, discussion: @discusssion}).to_json
  end

  def show

    @discussion = Discussion.find(params[:id])
    @comment = Comment.new
    render :json => render_to_string('show', layout: false).to_json
  end

  def create

    @user = current_user
    @discussion = Discussion.create(params[:discussion])
    render :json => render_to_string(@discussion, layout: false).to_json
  end

  def load_stone
    @stone = Stone.find(params[:stone_id])
  end
end
