class CommentsController < ApplicationController
  def create
    # TODO: you're failing silently
    @comment = Comment.create(params[:comment])
    render :json => render_to_string(@comment).to_json # BOOM
  end
end
