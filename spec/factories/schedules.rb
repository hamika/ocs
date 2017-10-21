FactoryGirl.define do
  factory :schedule do
    term_from { Faker::Time.between(DateTime.now.beginning_of_month,
      DateTime.now) }
    term_to { Faker::Time.between(DateTime.now, DateTime.now.end_of_month) }
    body { Faker::Lorem.characters(32) }
    destination { Faker::Address.city }
    after(:build) do |schedule|
      schedule.action_plan = FactoryGirl.build(:action_plan,
        id: schedule.action_plan_id)
      schedule.customers << FactoryGirl.build(:customer)
    end

    factory :invalid_schedule do
      term_from nil
      term_to nil
      body nil
      destination nil
      action_plan_id nil
    end

    factory :sample_schedule do
      term_from 19000101
      term_to 19001231
      body 'hogehoge'
      destination 'shibuya'
      action_plan_id 10
    end
  end
end
