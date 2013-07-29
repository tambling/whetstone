class Vote < ActiveRecord::Base
	attr_accessible :user_id, :resources_stone_id, :value

  belongs_to :voteable, polymorphic: true
  belongs_to :user

	validates :value, presence: true
	validates :value, inclusion: {:in => [-1,1]}
	validates_uniqueness_of :user_id, scope: [:voteable_type,:voteable_id]

end
