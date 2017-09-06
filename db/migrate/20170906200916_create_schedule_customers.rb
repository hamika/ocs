class CreateScheduleCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_customers do |t|
      t.references :schedule, index:true, foreign_key: true
      t.references :customer, index:true, foreign_key: true
      t.timestamps
    end
  end
end
