FactoryGirl.define do
  password = Faker::Internet.password(8)

  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    password { password }
    password_confirmation { password }
    authority :admin
  end
end
