SUBJECTS= ["French", "Cooking", "Ruby", "Fencing", "Guitar", "Mandarin Chinese", "Gardening"]
DIFFICULTY = ["Beginner", "Intermediate", "Advanced", "Expert"]

FactoryGirl.define do
  factory :user, aliases: [:to, :from] do |f|
    f.sequence(:name) { |n| "User#{n}" }
    f.sequence(:email) { |n| "User#{n}@whetstone.com" }
    f.password "password"
    f.password_confirmation { |u| u.password }
  end

  factory :stones_user do
    user
    stone
    queue ""
  end

  factory :saved_resource do
    stones_user
    resources_stone
  end

  factory :stone do
  	title { SUBJECTS.sample }
  	description {"Learn #{title} in 6 weeks"}
  end

  factory :resources_stone do
    stone
    resource
  end

  factory :resource do
    title "An excellent resource."
    description "This will help your learning."
    url "http://www.youtube.com"
    recommended_time "An hour"
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
    value 1
    user
  end

  factory :message do
    from
    to
    body "Test Message"
  end

end
