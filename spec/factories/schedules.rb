FactoryGirl.define do
  factory :schedule do
    association :action_plan
    target { Faker::Number.number(1) }
    achievement { Faker::Number.number(5) }
    body { Faker::Lorem.characters(32) }
    destination { Faker::Address.city }

    after(:build) do |schedule|
      [:male, :female].each do |gender|
        schedule.customers << build(
          :customer,
          gender: gender,
          schedule: schedule
          )
      end
    end

    factory :invalid_schedule do
      body nil
    end
  end
end
