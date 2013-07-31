class ResourcesController < ApplicationController
include ImageHelper

  def index
    @stone = Stone.find(params[:stone_id])
    @goal = current_user.goals.where(stone_id: @stone.id).first if user_signed_in?
    render :json => render_to_string(partial: 'index', locals: { stone: @stone, goal: @goal }).to_json
  end

  def new
    @stone = Stone.find(params[:stone_id])
    @resource = Resource.new
    render :json => render_to_string(partial: 'form', locals: {resource: @resource, stone: @stone }).to_json
  end

  def create
    info = params[:resource]
    info_with_photos = info.merge(:photo => top_image(info["url"]))
    resource = Resource.create(info_with_photos)
    resources_stone = ResourcesStone.create(resource_id: resource.id, stone_id: params[:stone_id])
    render :json => render_to_string(partial: 'resources/resources_stone', locals: { resources_stone: resources_stone}).to_json
  end

  def filter
    @resources_stones = Stone.find(params[:stone_id]).resources_stones.select {|resources_stone| resources_stone.resource.difficulty == params[:filter]}

    render :json => render_to_string(partial: 'resources_stone', collection: @resources_stones, as: :resources_stone).to_json

  end
end
