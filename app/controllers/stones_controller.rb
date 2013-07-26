class StonesController < ApplicationController
  def index
    @stones = Stone.all
  end

  def show
    @stone = Stone.find(params[:id])
  end

  def new
    @stone = Stone.new
  end

  def create
    @stone = Stone.create(params[:stone])
    redirect_to stone_path(@stone)
  end

  def search
    # @stone = Stone.find_by_title(params[:search][:search_query])  
    @stone = Stone.search { fulltext params[:search][:search_query] }.results.pop
    if @stone
      redirect_to stone_path(@stone)
    else
      redirect_to root_path # Must go to page that asks if he wants to create a new stone
    end
  end
end
