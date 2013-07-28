FactoryGirl.define do
  factory :alt_stone, :parent => :stone do
    title { "blah" }
    description {"Learn #{title} in 6 weeks"}

    factory :alt_stone_with_resources do
      after(:create) do |u|
        u.resources << create(:resource)
      end
    end
  end

  factory :resource_stone, :class => ResourcesStone do
    stone_id 43
    resource_id 57 
  end
end
