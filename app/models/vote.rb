class Vote < ActiveRecord::Base
	validates_presence_of :value

	belongs_to :user
	belongs_to :resource
	belongs_to :stone

	validates :value, inclusion: {:in => [-1,1]}
	validates_uniqueness_of :user_id, scope: [:stone_id, :resource_id]

end