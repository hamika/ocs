FactoryGirl.define do
  factory :customer do
    # association :schedule
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.city }
    phone { Faker::Number.number(11) }
    email { Faker::Internet.safe_email }
    birthday { Faker::Date.birthday(18, 65) }
    gender :male

    factory :invalid_customer do
      first_name nil
      last_name nil
      address nil
      phone nil
      email nil
      birthday nil
      gender nil
    end
  end
end
