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
  has_many :goals, class_name: "StonesUser", foreign_key: 'user_id'
  has_many :stones, through: :goals


  validates :name, presence: true

end
