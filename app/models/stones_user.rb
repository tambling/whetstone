class StonesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :stone

  has_many :timelines
end
