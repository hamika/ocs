class Customer < ApplicationRecord
  has_many :schedule_customers
  has_many :schedules, through: :schedule_customers

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true, numericality: { only_integer: true }

  enum gender: { male: 0, female: 1 }

  scope :search_first_name, ->(first_name) {
    where("first_name like ?", "%#{first_name}%")
  }
end
