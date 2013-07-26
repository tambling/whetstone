class ResourcesStone < ActiveRecord::Base
	attr_accessible :id
	has_many :votes

  belongs_to :stone
  belongs_to :resource

	def votes
		Vote.where('resources_stone_id = ?', self.id).count
	end
end
