# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	name "John Doe"
  	email "user@example.com"
  	password "secretsecret"
  end

  factory :user_with_stones, :parent => :user do
    after(:create) do |u|
      u.stones << create(:stone)
    end
  end

  factory :stone do
  	title "Learn JavaScript"
  	description "Learn JS in 6 weeks"

  factory :stone_with_resources, :parent => :stone do
    after(:create) do |u|
      u.resources << create(:resource)
    end
  end

  end

  factory :resource do
  	title "Codeschools Guide to Javscript"
  	description "Some Link"
  	recommended_time 60 #seconds
  end

	factory :vote do
		value [1, -1].sample
  	user
  	resource
  end

end
