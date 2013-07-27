class Discussion < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :stone_id

  has_many :comments, as: :commentable

  belongs_to :user
  belongs_to :stone
end
