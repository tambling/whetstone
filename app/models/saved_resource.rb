class SavedResource < ActiveRecord::Base
 attr_accessible :stones_user_id, :resources_stone_id

 validates :stones_user_id, uniqueness: { scope: :resources_stone_id }

 belongs_to :resources_stone
 belongs_to :stones_user
end
