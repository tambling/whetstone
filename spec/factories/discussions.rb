# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :discussion do
    title { Faker::Company.catch_phrase }
    content { Faker::Lorem.sentence }
    user
  end
end
