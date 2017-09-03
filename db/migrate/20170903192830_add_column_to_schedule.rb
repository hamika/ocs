class AddColumnToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :activity_setup, :boolean
    add_column :schedules, :activity_interview, :boolean
    add_column :schedules, :activity_inspection, :boolean
    add_column :schedules, :activity_presentation, :boolean
    add_column :schedules, :activity_engagement, :boolean
  end
end
