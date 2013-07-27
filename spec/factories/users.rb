# Read about factories at https://github.com/thoughtbot/factory_girl
SUBJECTS= ["French", "Cooking", "Ruby", "Fencing", "Guitar", "Mandarin Chinese", "Gardening"]
DIFFICULTY = ["Beginner", "Intermediate", "Advanced", "Expert"]

FactoryGirl.define do
  factory :user do
  	name { "John Doe" }
  	email { "user@example.com" }
  	password "password"
  end

  factory :stone do
  	title { SUBJECTS.sample }
  	description {"Learn #{title} in 6 weeks"}
  end

  factory :resource do
    title "An excellent resource."
    description "This will help your learning."
    url "http://www.youtube.com"
    recommended_time 3600 #seconds
    difficulty { DIFFICULTY.sample }
  end

  factory :discussion do
    title { Faker::Company.catch_phrase }
    content { Faker::Lorem.sentence }
  end

  factory :comment do
    content { Faker::Lorem.sentence }
  end

  factory :vote do
    value [1, -1].sample
  end

end
