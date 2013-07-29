class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id

  validates :content, presence: true

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  def vote_tally
  	self.votes.sum('value')
  end
end
