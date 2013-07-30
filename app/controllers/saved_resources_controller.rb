class SavedResourcesController < ApplicationController
  
  def create

    unless user_signed_in?
      render nothing: true, status: :unauthorized
      return
    end

    resources_stone = ResourcesStone.find(params[:resources_stone_id])
    goal = current_user.create_goal_for(resources_stone.stone)

    saved_resource = SavedResource.new(stones_user_id: goal.id, resources_stone_id: resources_stone.id)

    if saved_resource.save
      goal.queue += ", #{saved_resource.id}"
      goal.save
      render json: saved_resource, status: :created
      return
    end
    
    render nothing: true, status: :unprocessable_entity

  end


end
