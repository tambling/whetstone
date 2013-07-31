class StonesUser < ActiveRecord::Base
	attr_accessible :stone, :user, :queue

  belongs_to :user
  belongs_to :stone

  has_many :saved_resources
  has_many :resources_stones, through: :saved_resources

  def queued_items
    parsed_queue = self.queue.split(', ').map{|num| num.to_i}.reject{|i| i==0}
    resources = []
    # TODO: remember inject?
    parsed_queue.each do |i|
      resources << SavedResource.find(i)
    end
    resources
  end
end
