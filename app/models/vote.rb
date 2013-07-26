class Vote < ActiveRecord::Base
	validates_presence_of :value

	belongs_to :user
	belongs_to :resource
end