class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    if params[:from] && params[:to]
      from_year = params[:from][:year]
      from_month = params[:from][:month]
      from_day = params[:from][:day]
      from_month.size == 1 ? from_month.insert(0, '0') : from_month
      from_day.size == 1 ? from_day.insert(0, '0') : from_day
      from_date = [from_year, from_month, from_day].join

      to_year = params[:to][:year]
      to_month = params[:to][:month]
      to_day = params[:to][:day]
      to_month.size == 1 ? to_month.insert(0, '0') : to_month
      to_day.size == 1 ? to_day.insert(0, '0') : to_day
      to_date = [to_year, to_month, to_day].join.to_date.tomorrow.to_s
      
      @schedules = Schedule.where("term_from >= ? and term_to < ?", from_date, to_date)
    else
      @schedules = Schedule.all
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)
    respond_to do |format|
      @schedule.target = 0 if @schedule.target == nil
      @schedule.achievement = 0 if @schedule.achievement == nil
      if @schedule.save
        format.html { redirect_to @schedule,
          notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created,
          location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:term_from, :term_to, :target,
        :achievement, :body, :destination, :action_plan_id,
        :activity_setup, :activity_interview, :activity_inspection,
        :activity_presentation, :activity_engagement,
        { customer_ids: [] })
    end
end
