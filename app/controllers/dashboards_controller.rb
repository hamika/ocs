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
      if schedule.activity_setup == true
        @activity_subtotal += 2
      end
      if schedule.activity_interview == true
        @activity_subtotal += 2
      end
      if schedule.activity_inspection == true
        @activity_subtotal += 3
      end
      if schedule.activity_presentation == true
        @activity_subtotal += 2
      end
      if schedule.activity_engagement == true
        @activity_subtotal += 1
      end
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
      # 例:
    @sum_up[:action_plan_target] =
      @activity_subtotal / (@action_plan.target * 10).to_f
  end
end



# activity_setup: true,
# activity_interview: false,
# activity_inspection: true,
# activity_presentation: false,
# activity_engagement: true
# 2, 3, 1, 2
# activity_setup: true,
# activity_interview: false,
# activity_inspection: false,
# activity_presentation: false,
# activity_engagement: false
#
# activity_setup: nil,
# activity_interview: nil,
# activity_inspection: nil,
# activity_presentation: nil,
# activity_engagement: nil
#
# activity_setup: nil,
# activity_interview: nil,
# activity_inspection: nil,
# activity_presentation: nil,
# activity_engagement: nil
#
# activity_setup: nil,
# activity_interview: nil,
# activity_inspection: nil,
# activity_presentation: nil,
# activity_engagement: nil
#
# activity_setup: false,
# activity_interview: false,
# activity_inspection: false,
# activity_presentation: false,
# activity_engagement: false
#
# activity_setup: false,
# activity_interview: false,
# activity_inspection: false,
# activity_presentation: false,
# activity_engagement: false
