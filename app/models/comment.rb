class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id

  has_many :comments, as: :commentable
  
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
