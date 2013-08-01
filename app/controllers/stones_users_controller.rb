class StonesUsersController < ApplicationController

  before_filter :load_resource, only: [:create, :new, :destroy]

  def create
    current_user.stones << @stone
    flash[:success] = "Added This To Your List of Goals!"
    render :json => render_to_string(partial: 'stones/stone', locals: {stone: @stone }).to_json
  end

  def new
    @stone = Stone.find(params[:stone_id])
    render nothing: true
  end

  def destroy
    StonesUser.destroy(params[:id])
    redirect_to root_path
  end

  def update_queue
    @goal = StonesUser.where(user_id: current_user.id, stone_id: params[:stone_id]).first
    @goal.update_attribute(:queue,  params[:queue].join(", "))
    render :nothing => true
  end

  protected
    def load_resource
      @stone = Stone.find(params[:stone_id])
    end
end
