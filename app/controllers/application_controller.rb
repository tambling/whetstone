class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  helper GravatarHelper

  def after_sign_in_path_for(user)
    session[:referrer] ? session[:referrer] : root_path
  end
end
