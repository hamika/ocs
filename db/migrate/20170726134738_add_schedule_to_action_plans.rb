class AddScheduleToActionPlans < ActiveRecord::Migration[5.1]
  def change
    add_reference :action_plans, :schedule, index: true, foreign_key: true
  end
end
