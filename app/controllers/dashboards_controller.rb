class DashboardsController < ApplicationController
  before_action :authenticate_user!

  # GET /dashboards
  # GET /dashboards.json
  def index
    puts "イ ン デ ッ ク ス テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
    # ar&rubyをいじるだけ！paramsとかとりあえずつS買わないかな！
    schedule = Schedule.where(action_plan_id: 5).select(:target, :achievement)
    p @schedule
  end
end
