class ResourcesController < ApplicationController
  def create
    resource = Resource.create(params[:resource])
    render :json => render_to_string(resource).to_json
  end
end
