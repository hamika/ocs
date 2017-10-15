FactoryGirl.define do
  factory :action_plan do
    target { Faker::Number.number(1) }
    achievement { Faker::Number.number(7) }
    body { Faker::Lorem.characters(32) }
  end
end
