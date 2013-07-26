class VotesController < ApplicationController
  
  def index
  end

  def show
  end

  def new
  end

  def create
    vote = Vote.new(user_id: current_user.id, resources_stone_id: params[:relationship_id], value: params[:value])  
    render status: 403 unless vote.save
  end

  def search
  end

end
