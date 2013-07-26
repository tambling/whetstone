class Resource < ActiveRecord::Base
	attr_accessible :recommended_time, :title, :description, :url

	validates_presence_of :title
	validates_presence_of :description

	has_many :votes

  has_many :resources_stones
  has_many :stones, through: :resources_stones

	
end
