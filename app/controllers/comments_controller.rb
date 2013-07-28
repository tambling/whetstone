class CommentsController < ApplicationController
  def create
    @comment = Comment.create(params[:comment])
    render :json => render_to_string(@comment).to_json
  end
end
