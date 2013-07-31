class Resource < ActiveRecord::Base
	attr_accessible :title, :description, :url, :recommended_time, :difficulty, :creator_id, :photo

  validates :title, :description, :recommended_time, presence: true

  has_many :votes

  has_many :resources_stones
  has_many :stones, through: :resources_stones

  belongs_to :creator, class_name: "User"

  before_create :assign_diffculty

  DEFAULT_DIFFICULTY = "Intermediate"

  def self.difficulty_ratings
    ["Beginner", "Intermediate", "Advanced", "Expert"]
  end

  def assign_diffculty
    self.difficulty = DEFAULT_DIFFICULTY if self.difficulty.blank?
  end
end
