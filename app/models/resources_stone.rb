class ResourcesStone < ActiveRecord::Base
	attr_accessible :id
	has_many :votes

	def votes
		Vote.where('resources_stone_id = ?', self.id).count
	end
end