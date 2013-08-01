class VotesController < ApplicationController

  def create
    @voteable = params[:class_name].constantize.find(params[:id])
    vote = @voteable.votes.build(user_id: current_user.id, value: params[:value])
    unless vote.save
      render :json => { message: "Can't vote twice on the same thing!"}.to_json
    else
      render :json => { message: "Voting Successful", value: @voteable.vote_tally }.to_json, status: :created
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
