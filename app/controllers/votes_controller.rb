class VotesController < ApplicationController

  def create
    vote = @voteable.votes.build(user_id: current_user.id, value: params[:value])
    unless vote.save
      render status: 403
    end
  end

  private

  def find_voteable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
