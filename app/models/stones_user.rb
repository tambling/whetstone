class StonesUser < ActiveRecord::Base
	attr_accessible :stone_id, :user_id, :queue
  belongs_to :user
  belongs_to :stone

  has_many :saved_resources
  has_many :resources_stones, through: :saved_resources
  def queued_items
    parsed_queue=self.queue.split(', ').map{|num| num.to_i}.reject{|i| i==0}
    resources = []
    parsed_queue.each do |i|
      resources << SavedResource.find(i).resources_stone
    end
    resources

  end
end
