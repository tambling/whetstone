class StonesUser < ActiveRecord::Base
	attr_accessible :stone_id, :user_id
  belongs_to :user
  belongs_to :stone

  has_many :saved_resources
  has_many :resources_stones, through: :saved_resources
end
