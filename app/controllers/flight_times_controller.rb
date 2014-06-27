class FlightTimesController < ApplicationController
  before_action :set_flight_time, only: [:show, :edit, :update, :destroy]

  # GET /flight_times
  # GET /flight_times.json
  def index
    @flight_times = FlightTime.all
  end

  # GET /flight_times/1
  # GET /flight_times/1.json
  def show
  end

  # GET /flight_times/new
  def new
    @flight_time = FlightTime.new
  end

  # GET /flight_times/1/edit
  def edit
  end

  # POST /flight_times
  # POST /flight_times.json
  def create
    @flight_time = FlightTime.new(flight_time_params)

    respond_to do |format|
      if @flight_time.save
        format.html { redirect_to @flight_time, notice: 'Flight time was successfully created.' }
        format.json { render action: 'show', status: :created, location: @flight_time }
      else
        format.html { render action: 'new' }
        format.json { render json: @flight_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flight_times/1
  # PATCH/PUT /flight_times/1.json
  def update
    respond_to do |format|
      if @flight_time.update(flight_time_params)
        format.html { redirect_to @flight_time, notice: 'Flight time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @flight_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flight_times/1
  # DELETE /flight_times/1.json
  def destroy
    @flight_time.destroy
    respond_to do |format|
      format.html { redirect_to flight_times_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight_time
      @flight_time = FlightTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_time_params
      params.require(:flight_time).permit(:flight, :time)
    end
end
