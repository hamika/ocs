class DashboardsController < ApplicationController
  before_action :authenticate_user!

  # GET /dashboards
  # GET /dashboards.json
  def index
    action_plan_id = params[:action_plan_id]
    @target_subtotal = 0
    @achiev_subtotal = 0
    @activity_subtotal = 0
    @schedules = Schedule.where(action_plan_id: action_plan_id)
    @schedules.each do |schedule|
      @target_subtotal += schedule.target
      @achiev_subtotal += schedule.achievement
      @activity_subtotal += 2 if schedule.activity_setup
      @activity_subtotal += 2 if schedule.activity_interview
      @activity_subtotal += 3 if schedule.activity_inspection
      @activity_subtotal += 2 if schedule.activity_presentation
      @activity_subtotal += 1 if schedule.activity_engagement
    end

    @sum_up = {}
    @action_plan = ActionPlan.find(action_plan_id)
    @sum_up[:target_score] =
      @target_subtotal - @action_plan.target
    @sum_up[:target_percentage] =
      @target_subtotal / @action_plan.target.to_f
    @sum_up[:achievement_score] =
      @achiev_subtotal - @action_plan.achievement
    @sum_up[:achievement_percentage] =
      @achiev_subtotal / @action_plan.achievement.to_f
    @sum_up[:action_plan_target] =
      @activity_subtotal / (@action_plan.target * 10).to_f
  end
end
