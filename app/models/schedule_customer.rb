class ScheduleCustomer < ApplicationRecord
  belongs_to :schedule
  belongs_to :customer
end
