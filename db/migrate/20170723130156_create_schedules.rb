class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.datetime :term_from
      t.datetime :term_to
      t.integer :target
      t.integer :achievement
      t.text :body
      t.string :destination

      t.timestamps
    end
  end
end
