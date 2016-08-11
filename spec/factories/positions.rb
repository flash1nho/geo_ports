FactoryGirl.define do
  factory :position do
    sequence(:title) { |n| "Title_#{n}" }
    sequence(:capacity) { |n| Faker::Number.decimal(5) }

    association :port

    date_open Time.now
  end

  factory :position_cargo, parent: :position, class: Positions::Cargo do
    type 'Positions::Cargo'
  end

  factory :position_vessel, parent: :position, class: Positions::Vessel do
    type 'Positions::Vessel'
  end
end
