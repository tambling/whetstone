class StonesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new]
  def index
    @stones = Stone.all
  end

  def show
    @stone = Stone.find(params[:id])
    @goal = current_user.goal_for(@stone) if user_signed_in?
  end

  def new
    @stone = Stone.new(title: session[:query])
    session.delete(:title)
  end

  def create
    @stone = Stone.create(params[:stone])
    flash[:success] = "Created a new Stone!"
    redirect_to stone_path(@stone)
  end

  def overview
    @stone = Stone.find(params[:id])
    @goal = current_user.goal_for(@stone) if user_signed_in?
    render :json => render_to_string(partial: 'stones/overview', locals: { stone: @stone, goal: @goal }, layout: false).to_json
  end

  # TODO: needs some refactoring
  def search
    @stones = Stone.basic_search(params[:query])
    search_results = {}
    search_results[:query] = params[:query]
    session[:query] = params[:query]

    if @stones.count.zero?
      search_results[:results_html] = render_to_string(partial: 'home/no_results', locals: {failed_query: params[:query] })
    else
      search_results[:results_html] = render_to_string(partial: 'home/search_results', collection: @stones, as: :stone)
    end

    if params[:mini_search]
      search_results[:mini] = true
      search_results[:index_html] = render_to_string('home/index', layout: false)
    end

    render :json => search_results.to_json
  end
end
