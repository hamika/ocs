class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    if params[:term_from] == nil && params[:achievement] == nil
      @schedules = Schedule.all
    elsif params[:achievement] != nil
      @schedules = Schedule.where(achievement: params[:achievement])
    else params[:term_from] != nil
      @schedules = Schedule.where(term_from: params[:term_from][:year])
    end
    puts "@@@@@ #{ @schedules } @@@@@"
    puts "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    puts "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS"
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
    puts "NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN"
  end

  # GET /schedules/1/edit
  def edit
    puts "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
    puts "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    if params[:activity_setup]   = 1
      @schedule[:activity_setup] = true
    else params[:activity_setup] = 0
      @schedule[:activity_setup] = false
    end
    if params[:activity_interview]   = 1
      @schedule[:activity_interview] = true
    else params[:activity_interview] = 0
      @schedule[:activity_interview] = false
    end
    if params[:activity_inspection]   = 1
      @schedule[:activity_inspection] = true
    else params[:activity_inspection] = 0
      @schedule[:activity_inspection] = false
    end
    if params[:activity_presentation]   = 1
      @schedule[:activity_presentation] = true
    else params[:activity_presentation] = 0
      @schedule[:activity_presentation] = false
    end
    if params[:activity_engagement]   = 1
      @schedule[:activity_engagement] = true
    else params[:activity_engagement] = 0
      @schedule[:activity_engagement] = false
    end

    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
    puts "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU"
    puts "#{ @schedule[:activity_setup] }"
    puts "#{ @schedule[:activity_interview] }"
    puts "#{ @schedule[:activity_inspection] }"
    puts "#{ @schedule[:activity_presentation] }"
    puts "#{ @schedule[:activity_engagement] }"
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
      params.require(:schedule).permit(:term_from, :term_to,
      :target, :achievement, :body, :destination, :action_plan_id,
      :year, :activity_setup, :activity_interview,
      :activity_inspection, :activity_presentation,
      :activity_engagement)
    end
end
