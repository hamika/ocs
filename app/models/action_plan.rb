class ActionPlan < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :nullify
  accepts_nested_attributes_for :schedules
end
