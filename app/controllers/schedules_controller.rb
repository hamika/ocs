class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    puts "イ ン デ ッ ク ス テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
    @schedules = Schedule.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    puts "ニ ュ ー 〜 ー テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
    puts "エ デ ィ ッ っ ト テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
  end

  # POST /schedules
  # POST /schedules.json
  def create
    puts "ク リ エ イ ト テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      p @schedule
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    puts "ア ッ プ デ イ ー ト テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
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
    puts "デ ス ト ロ イ テ ス ト テ ス ト ホ ゲ ホ ゲ 〜"
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
      params.require(:schedule).permit(:term_from, :term_to, :target, :achievement, :body, :destination, :action_plan_id)
    end
end
