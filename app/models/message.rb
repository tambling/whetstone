class Message < ActiveRecord::Base
  belongs_to :from, :class_name => "User", :foreign_key => "from_id"
  belongs_to :to, class_name: "User", foreign_key: "to_id"
  attr_accessible :body, :from_id, :to_id

  validates :body, :from_id, :to_id, presence: true
end
