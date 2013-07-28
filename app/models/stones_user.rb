class StonesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  has_many :timelines
end
