class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  # has_and_belongs_to_many :stones
  has_many :goals
  has_many :stones, through: :goals
  has_many :discussions
  has_many :comments
  has_many :sent_messages, class_name: 'Message', foreign_key: :from_id
  has_many :received_messages, class_name: 'Message', foreign_key: :to_id

  validates :name, presence: true

  def messages_with(user)
    sent_to = sent_messages.where(to_id: user.id)
    received_from = received_messages.where(from_id: user.id)
    all = sent_to + received_from
    all.sort{ |message1, message2| message1.created_at <=> message2.created_at }
  end

  def messages
    sent_messages+received_messages
  end

  def message_partners
    partners = []
    self.messages.each do |message|
      partners << message.from unless partners.include?(message.from) || message.from == self
      partners << message.to unless partners.include?(message.to) || message.to == self
    end
    partners
  end

  def next_queued_resource
    queued_items = []
    self.goals.each do |goal|
      queued_items << goal.saved_resources.all
    end
    queued_items.flatten.sort{|a, b| a.due_date <=> b.due_date}.first
  end
end
