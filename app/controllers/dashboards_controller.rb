class DashboardsController < ApplicationController
  before_action :authenticate_user!

  # GET /dashboards
  # GET /dashboards.json
  def index
    puts "イ ン デ ッ ク ス テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
    # ar&rubyをいじるだけ！paramsとかとりあえずつS買わないかな！
    schedules = Schedule.where(action_plan_id: 5).select(:target, :achievement)
    array = []
    schedules.each do |i|
      array << i[:target]
      array << i[:achievement]
      # array = array.inject(:target)
      p array
    end
  end
end
