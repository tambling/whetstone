class ResourcesController < ApplicationController
  def create
    resource = Resource.create(params[:resource])
    resources_stone = ResourcesStone.create(resource_id: resource.id, stone_id: params[:stone_id])

    render :json => render_to_string(partial: 'stones/resources_stone', locals: { resources_stone: resources_stone}).to_json
  end
end
