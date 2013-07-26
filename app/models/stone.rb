class Stone < ActiveRecord::Base
	validates_uniqueness_of :title
	validates_presence_of :title
	validates_presence_of :description
  attr_accessible :title, :description
	has_and_belongs_to_many :users
	has_and_belongs_to_many :resources

end
