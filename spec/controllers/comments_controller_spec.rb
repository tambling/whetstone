require 'spec_helper'

describe CommentsController do
  it 'returns a string upon creating a comment' do
    post :create, comment: {content: "text", commentable_id: 1, commentable_type: "Discussion", user_id: 1}
    response.body.should be_an_instance_of(String)
  end

end
