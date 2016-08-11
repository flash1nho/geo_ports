FactoryGirl.define do
  factory :port do
    sequence(:title) { |n| "Title_#{n}" }
    lat Faker::Address.latitude
    lng Faker::Address.longitude
  end
end
