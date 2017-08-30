class Schedule < ApplicationRecord
  belongs_to :action_plan
  has_many :customers
end
