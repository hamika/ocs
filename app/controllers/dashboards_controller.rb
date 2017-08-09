class DashboardsController < ApplicationController
  before_action :authenticate_user!

  # GET /dashboards
  # GET /dashboards.json
  def index
    puts "イ ン デ ッ ク ス テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
    # ar&rubyをいじるだけ！paramsとかとりあえずつS買わないかな！
    Schedule.where(action_plan_id: 5).select(:target).map do |schedule|
      array = []
      hash = schedule.slice(:target).flatten
      p hash
    end
  end
end
