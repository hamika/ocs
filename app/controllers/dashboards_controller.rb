class DashboardsController < ApplicationController
  before_action :authenticate_user!

  # GET /dashboards
  # GET /dashboards.json
  def index
    num = params[:action_plan]
    array = []
    @schedules = Schedule.where(action_plan_id: num)
    @schedules.each do |schedule|
      array << [schedule[:target], schedule[:achievement]]
    end

    @target_subtotal = 0
    @achiev_subtotal = 0
    array.each do |ary|
      @target_subtotal += ary[0]
      @achiev_subtotal += ary[1]
    end

    @sum_up = {}
    @action_plans = ActionPlan.find(num)
    @sum_up[:target_score] = @target_subtotal - @action_plans[:target]
    tp = @target_subtotal / @action_plans[:target].to_f * 100
    @sum_up[:target_percentage] = tp.to_s(:percentage, precision: 2,
                                          delimiter: '.', separator: ',')
    @sum_up[:achievement_score] = @achiev_subtotal - @action_plans[:achievement]
    ap = @achiev_subtotal / @action_plans[:achievement].to_f * 100
    @sum_up[:achievement_percentage] = ap.to_s(:percentage, precision: 2,
                                               delimiter: '.', separator: ',')
  end
end
