class Schedule < ApplicationRecord
  belongs_to :action_plan
  has_many :schedule_customers
  has_many :customers, through: :schedule_customers
end
