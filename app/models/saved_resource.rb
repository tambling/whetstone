class SavedResource < ActiveRecord::Base
 attr_accessible :stones_user_id, :resource_id

 belongs_to :stones_user
 belongs_to :user, through: :stones_users
 belongs_to :resource
end
