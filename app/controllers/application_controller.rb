class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  helper GravatarHelper

  # TODO: EDIT PROFILE IS NOT WORKING
  def authenticate_user!
    request.xhr? ? handle_xhr : super    
  end

  def handle_xhr
    render :json => "you need to be logged in", :status => :unauthorized unless user_signed_in?
  end

end
