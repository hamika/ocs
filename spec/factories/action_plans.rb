FactoryGirl.define do
  factory :action_plan do
    term_from { Faker::Time.between(DateTime.now.beginning_of_month,
      DateTime.now) }
    term_to { Faker::Time.between(DateTime.now, DateTime.now.end_of_month) }
    target { Faker::Number.number(1) }
    achievement { Faker::Number.number(7) }
    body { Faker::Lorem.characters(32) }
  end
end
