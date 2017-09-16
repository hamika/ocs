class Customer < ApplicationRecord
  before_save { self.email = email.downcase }
  enum gender: { male: 0, female: 1, }

  has_many :schedule_customers
  has_many :schedules, through: :schedule_customers

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true,
    length: { maximum: 11 }, numericality: { only_integer: true }
  validates :email, length: { maximum: 128 }, uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  scope :search_full_name, ->(first_name, last_name) {
    where("first_name like ? and last_name like ?", "%#{first_name}%", "%#{last_name}%")
  }
end
