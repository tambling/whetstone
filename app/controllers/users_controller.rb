class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def search
    p params
    @users = User.basic_search(params[:username])
    p "*"*1000
    p @users
    if @users.size.zero?
      return render :text => "We don't know anybody by that name!"
    else
      return render partial: 'users_search', collection: @users, as: :user, layout: false
    end
    return 200
  end
end
