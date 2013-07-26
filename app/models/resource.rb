class Resource < ActiveRecord::Base
	attr_accessible :recommended_time, :title, :description, :url

	validates_presence_of :title
	validates_presence_of :description
	validates_presence_of :recommended_time

	has_many :votes
	has_and_belongs_to_many :stones
end
