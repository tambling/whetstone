# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do |c|
    content { Faker::Lorem.sentence }
    user
    c.association :commentable, :factory => discussion
  end

  factory :nested_comment, :class => Comment do |c|
    content { Faker::Lorem.sentence }
    user
    c.association :commentable, :factory => comment
  end
end
