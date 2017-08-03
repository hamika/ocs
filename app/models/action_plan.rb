class ActionPlan < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :nullify
end
