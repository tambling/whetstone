class VotesController < ApplicationController

  def create
    vote = @voteable.votes.build(user_id: current_user.id, value: params[:value]) if @voteable
    unless vote.save
      flash[:error] = "Oops. Something Went Wrong!"
      render status: 403
    end
  end

  private

  def voteable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return @voteable = $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
