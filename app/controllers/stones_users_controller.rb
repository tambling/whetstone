class StonesUsersController < ApplicationController
  def create
    current_user.goals << StonesUser.new(goal_id)
  end
end
