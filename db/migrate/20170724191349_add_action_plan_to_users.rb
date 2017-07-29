class AddActionPlanToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :action_plan, index: true, foreign_key: true
  end
end
