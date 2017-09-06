class Customer < ApplicationRecord
  has_many :schedule_customers
  has_many :schedules, through: :schedule_customers
  enum gender: { male: 0, female: 1 }
end
