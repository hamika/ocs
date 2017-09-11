class ActionPlan < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :nullify
  
  validates :target, presence: true,
            numericality: { only_integer: true }
  validates :achievement, presence: true,
            numericality: true
  validates :body, presence: true, length: { maximum: 64 }
end
