class Stone < ActiveRecord::Base
  attr_accessible :title, :description
	
	validates_uniqueness_of :title
	validates_presence_of :title
	validates_presence_of :description

  has_many :stones_users
	has_many :users, through: :stones_users

  has_many :resources_stones
  has_many :resources, through: :resources_stones

  has_many :discussions

end
