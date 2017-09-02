class Customer < ApplicationRecord
  belongs_to :schedule, optional: true
  enum gender: { male: 0, female: 1 }
end
