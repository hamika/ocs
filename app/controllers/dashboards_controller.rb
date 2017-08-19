class DashboardsController < ApplicationController
  before_action :authenticate_user!

  # GET /dashboards
  # GET /dashboards.json
  def index
    puts "イ ン デ ッ ク ス テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
    num = 5
    array = []
    schedules = Schedule.where(action_plan_id: num)
    schedules.each do |schedule|
      array << [schedule[:target], schedule[:achievement]]
    end

    t_result = 0
    a_result = 0
    array.each do |ary|
      t_result += ary[0]
      a_result += ary[1]
    end

    sum_up = {}
    action_plan = ActionPlan.find(num)
    sum_up[:target] = t_result / action_plan[:target].to_f
    sum_up[:achievement] = a_result / action_plan[:achievement].to_f
  end
end
