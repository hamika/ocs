class DashboardsController < ApplicationController
  before_action :authenticate_user!

  # GET /dashboards
  # GET /dashboards.json
  def index
    num = params[:action_plan]
    # array = []
    @target_subtotal = 0
    @achiev_subtotal = 0
    @schedules = Schedule.where(action_plan_id: num)
    @schedules.each do |schedule|
      @target_subtotal += schedule[:target]
      @achiev_subtotal += schedule[:achievement]
    end

    @sum_up = {}
    @action_plan = ActionPlan.find(num)
    @sum_up[:target_score] = @target_subtotal - @action_plan[:target]
    @sum_up[:target_percentage] = @target_subtotal /
                                  @action_plan[:target].to_f * 100
    @sum_up[:achievement_score] = @achiev_subtotal - @action_plan[:achievement]
    @sum_up[:achievement_percentage] = @achiev_subtotal /
                                       @action_plan[:achievement].to_f * 100
  end
end
