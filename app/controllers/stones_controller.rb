class StonesController < ApplicationController
  def index
    @stones = Stone.all
  end

  def show
    @stone = Stone.find(params[:id])
    @goal = current_user.goals.where(stone_id: @stone.id).first if user_signed_in?
  end

  def new
    authenticate_user!
    @stone = Stone.new(title: session[:failed_query])
    session.delete(:title)
  end

  def create
    @stone = Stone.create(params[:stone])
    redirect_to stone_path(@stone)
  end

  def overview
    @stone = Stone.find(params[:id])
    @goal = current_user.goals.where(stone_id: @stone.id).first if user_signed_in?
    render :json => render_to_string(partial: 'stones/overview', locals: { stone: @stone, goal: @goal }, layout: false).to_json
  end

  def search
    @stones = Stone.basic_search(params[:query])
    if @stones.count.zero?
      session[:failed_query] = params[:query]
      render :json => render_to_string(partial: 'home/no_results', locals: {failed_query: params[:query]}).to_json
    else
      render :json => render_to_string(partial: 'home/search_results', collection: @stones, as: :stone).to_json
    end

    # if @stones.count == 1
    #   redirect_to stone_path(@stones.first)
    # elsif @stones.count == 0
    #   session[:title] = params[:search][:search_query]
    #   if current_user
    #     flash[:apology] = "Sorry, we weren't able to find anything about that. Maybe you'd like to start the community for #{session[:title]}?"
    #     redirect_to new_stone_path
    #   else
    #     session[:referrer] = new_stone_path
    #     flash[:apology] = "We weren't able to find anything about #{session[:title]}! If you log in, you can create a stone for this and push the cause of knowledge forward!"
    #     redirect_to new_user_session_path
    #   end
    # end
  end
end
