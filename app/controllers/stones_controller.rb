class StonesController < ApplicationController
  def index
    @stones = Stone.all
  end

  def show
    @stone = Stone.find(params[:id])
    @goal = current_user.goals.where(stone_id: @stone.id).first if user_signed_in?
    @can_be_added = @goal.nil? && current_user
    @resource = Resource.new
  end

  def new
    unless current_user
      redirect_to root_path
    end
    @stone = Stone.new(title: session[:title])
    session.delete(:title)
  end

  def create
    @stone = Stone.create(params[:stone])
    redirect_to stone_path(@stone)
  end

  def search
    @stones = Stone.where(title: params[:search][:search_query]) #Replace with more advanced search algorithm (when it's ready).
    if @stones.count == 1
      redirect_to stone_path(@stones.first)
    elsif @stones.count == 0
      session[:title] = params[:search][:search_query]
      if current_user
        flash[:apology] = "Sorry, we weren't able to find anything about that. Maybe you'd like to start the community for #{session[:title]}?"
        redirect_to new_stone_path
      else
        session[:referrer] = new_stone_path
        flash[:apology] = "We weren't able to find anything about #{session[:title]}! If you log in, you can create a stone for this and push the cause of knowledge forward!"
        redirect_to new_user_session_path
      end
    end
  end
end
