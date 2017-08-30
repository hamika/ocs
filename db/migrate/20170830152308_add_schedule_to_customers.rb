class AddScheduleToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_reference :customers, :schedule, index: true, foreign_key: true
  end
end
