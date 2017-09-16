class Schedule < ApplicationRecord
  belongs_to :action_plan
  has_many :schedule_customers, dependent: :destroy
  has_many :customers, through: :schedule_customers

  accepts_nested_attributes_for :schedule_customers,
                                allow_destroy: true
  if @schedule.present?
    validates :target, numericality: { only_integer: true }
    validates :achievement, numericality: true    
  end
  validates :body, presence: true, length: { maximum: 512 }
end
