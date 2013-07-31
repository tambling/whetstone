class ResourcesStone < ActiveRecord::Base
	attr_accessible :id, :stone_id, :resource_id

  has_many :votes, as: :voteable

  belongs_to :stone
  belongs_to :resource

  def vote_tally
  	self.votes.sum('value')
  end

end
