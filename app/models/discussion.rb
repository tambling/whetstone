class Discussion < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :stone_id

  validates :title, presence: true
  
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  belongs_to :user
  belongs_to :stone
end
