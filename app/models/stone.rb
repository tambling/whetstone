class Stone < ActiveRecord::Base
  attr_accessible :title, :description

	validates :title, uniqueness: true
	validates :title, :description, presence: true

  has_many :stones_users
	has_many :users, through: :stones_users

  has_many :resources_stones
  has_many :resources, through: :resources_stones

  has_many :discussions
end
