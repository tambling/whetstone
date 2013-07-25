# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	name "John Doe"
  	email "user@example.com"
  	password "secretsecret"
  	stone
  end

  factory :stone do
  	title "Learn JavaScript"
  	description "Learn JS in 6 weeks"
  	user
  end

  factory :resource do
  	title "Codeschools Guide to Javscript"
  	description "Some Link"
  	recommemded_time 60 #seconds
  	stone
  end

	factory :vote do
		value [1, -1].sample
  	user
  	resource
  end

end
