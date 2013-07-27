class Resource < ActiveRecord::Base
	attr_accessible :title, :description, :url, :recommended_time, :difficulty

	validates_presence_of :title
	validates_presence_of :description

	has_many :votes

  has_many :resources_stones
  has_many :stones, through: :resources_stones

	def self.difficulty_ratings
    ["Beginner", "Intermediate", "Advanced", "Expert"]
  end
end
