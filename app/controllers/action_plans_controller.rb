class ActionPlansController < ApplicationController
  before_action :set_action_plan, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /action_plans
  # GET /action_plans.json
  def index
    puts "イ ン デ ッ ク ス テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
    @action_plans = ActionPlan.all
  end

  # GET /action_plans/1
  # GET /action_plans/1.json
  def show
  end

  # GET /action_plans/new
  def new
    puts "ニ ュ ー 〜 ー テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
    @user = current_user.id
    puts "#{@user} hogehgoe!!!!!"
    @action_plan = ActionPlan.new
  end

  # GET /action_plans/1/edit
  def edit
    puts "エ デ ィ ッ っ ト テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
  end

  # POST /action_plans
  # POST /action_plans.json
  def create
    puts "ク リ エ イ ト テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
    @action_plan = ActionPlan.new(action_plan_params)

    respond_to do |format|
      # ap = ActionPlan.find(params[:user_id])
      # ap = current_user
      # puts "#{@user}"
      # ap.save
      @action_plan.user_id = current_user.id
      if @action_plan.save
        format.html { redirect_to @action_plan, notice: 'Action plan was successfully created.' }
        format.json { render :show, status: :created, location: @action_plan }
      else
        format.html { render :new }
        format.json { render json: @action_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_plans/1
  # PATCH/PUT /action_plans/1.json
  def update
    puts "ア ッ プ デ イ ー ト テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
    respond_to do |format|
      if @action_plan.update(action_plan_params)
        format.html { redirect_to @action_plan, notice: 'Action plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @action_plan }
      else
        format.html { render :edit }
        format.json { render json: @action_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_plans/1
  # DELETE /action_plans/1.json
  def destroy
    puts "デ ス ト ロ イ テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
    @action_plan.destroy
    respond_to do |format|
      format.html { redirect_to action_plans_url, notice: 'Action plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_plan
      @action_plan = ActionPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_plan_params
      params.require(:action_plan).permit(:term_from, :term_to, :target, :achievement, :body)
    end
end
