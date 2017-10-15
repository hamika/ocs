class Customer < ApplicationRecord
  before_save { self.email &&= email.downcase }
  enum gender: { male: 0, female: 1, }

  has_many :schedule_customers
  has_many :schedules, through: :schedule_customers

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true,
            length: { maximum: 11 },
            numericality: { only_integer: true }
            # uniqueness: { scope: :schedule_id }
  validates :email, presence: true,
            length: { maximum: 64 }, uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  def full_name
    [first_name, last_name].join(' ')
  end

  def self.search_full_name(first_name, last_name)
    where("first_name like ? and last_name like ?",
      "%#{first_name}%", "%#{last_name}%")
  end

  def self.by_letter(letter)
    where("last_name like ?", "#{letter}%").order(:last_name)
  end
end
