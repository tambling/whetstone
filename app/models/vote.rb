class Vote < ActiveRecord::Base
	attr_accessible :user_id, :resources_stone_id, :value

	validates_presence_of :value

	belongs_to :voteable, polymorphic: true


	validates :value, inclusion: {:in => [-1,1]}
	validates_uniqueness_of :user_id, scope: [:resources_stone_id]

end