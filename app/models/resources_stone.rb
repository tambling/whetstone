class ResourcesStone < ActiveRecord::Base
	attr_accessible :id, :stone_id, :resource_id
	

  belongs_to :stone
  belongs_to :resource

  has_many :votes

	def votes
		Vote.where('resources_stone_id = ?', self.id).sum('value')
	end
end
