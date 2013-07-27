# Read about factories at https://github.com/thoughtbot/factory_girl
SUBJECTS= ["French", "Cooking", "Ruby", "Fencing", "Guitar", "Mandarin Chinese", "Gardening"]
DIFFICULTY = ["Beginner", "Intermediate", "Advanced", "Expert"]

FactoryGirl.define do
  factory :user do
  	name { Faker::Name.name }
  	email { Faker::Internet.email }
  	password "password"
  end

  factory :user_with_stones, :parent => :user do
    after(:create) do |u|
      u.stones << stone
    end
  end

  factory :stone do
  	title { SUBJECTS.sample }
  	description {"Learn #{title} in 6 weeks"}
  end

  factory :stone_with_resources, :parent => :stone do
    after(:create) do |u|
      50.times { u.resources << create(:resource) }
    end
  end

  factory :resource do
    title "An excellent resource."
    description "This will help your learning."
    recommended_time 3600 #seconds
    difficulty { DIFFICULTY.sample }
  end

  factory :vote do
    value [1, -1].sample
    user
  end

end
