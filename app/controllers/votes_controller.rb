class VotesController < ApplicationController
  
  def index
  end

  def show
  end

  def new
  end

  def create
    Vote.create(user_id: current_user.id, resources_stone_id: params[:relationship_id], value: params[:value])  
  end

  def search
  end

end
