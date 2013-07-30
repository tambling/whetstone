class Stone < ActiveRecord::Base
  attr_accessible :title, :description

	validates :title, uniqueness: true
	validates :title, :description, presence: true

  has_many :goals
	has_many :users, through: :goals

  has_many :resources_stones
  has_many :resources, through: :resources_stones

  has_many :discussions
end
