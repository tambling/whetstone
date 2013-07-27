class VotesController < ApplicationController
  
  def index
  end

  def show
  end

  def new
  end

  def create
    vote = Vote.new(user_id: current_user.id, resources_stone_id: params[:resources_stone_id], value: params[:value])  
    unless vote.save
      render status: 403
    end
  end

  def search
  end

end
