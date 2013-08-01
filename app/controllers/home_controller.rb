class HomeController < ApplicationController
  def index
    flash.delete(:query)
  end
end
