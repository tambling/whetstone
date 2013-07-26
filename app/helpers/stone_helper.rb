module StoneHelper
	def get_relationship(resource_id, stone_id)
		relationship = ResourcesStone.where('resource_id = ?', resource_id).where('stone_id = ?', stone_id)
		relationship.first
	end
end