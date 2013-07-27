class DiscussionsController < ApplicationController
  def index
    @stone = Stone.find(params[:stone_id])
    @discussion = Discussion.new
    render :json => render_to_string('index', layout: false).to_json
  end

  def create
  end
end
