class SavedResource < ActiveRecord::Base
 attr_accessible :goal_id, :resources_stone_id

 validates :goal_id, uniqueness: { scope: :resources_stone_id }

 belongs_to :resources_stone
 belongs_to :goal
end
