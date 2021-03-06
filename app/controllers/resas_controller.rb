class ResasController < GreetingsController
  before_filter :require_token
  before_action :set_resa, only: [:show, :edit, :update, :destroy]

  # GET /resas
  # GET /resas.json
  def index
    if params.include?(:sans_vol) and params[:sans_vol] == "1"
      @resas = Resa.no_flight_assigned
    else
      @resas = Resa.all
    end

    if params.include?(:resa_date)
      @date_debut = Date.strptime(params[:resa_date], "%d/%m/%y")
      @jour = @date_debut
      @date_fin = @date_debut
      @resas = @resas.all_for_those_dates(@date_debut,@date_debut)
    elsif params.include?(:date_debut) or params.include?(:date_fin) 
      @date_debut = Date.strptime(params[:date_debut], "%d/%m/%y") unless params[:date_debut].nil? or params[:date_debut] == ""
      @date_fin = Date.strptime(params[:date_fin], "%d/%m/%y") unless params[:date_fin].nil? or params[:date_fin] == ""
      @resas = @resas.all_for_those_dates(@date_debut,@date_fin)
    end

  end

  # GET /resas/1
  # GET /resas/1.json
  def show
  end

  # GET /resas/new
  def new
    @resa = Resa.new
    if params.include?(:flight_id)
     theFlight = Flight.find(params[:flight_id])
     @resa.flight_id = theFlight.id
     @resa.flight_time_id = theFlight.flight_time.id
     @resa.demand = theFlight.flight_date
     @resa.heure_demand = theFlight.time_tk_off.to_s
    end
    @available_flights = Flight.list_upcoming_visible_flights.order(:flight_ref)
    #@resa.paxes.build
  end

  # GET /resas/1/edit
  def edit
    @available_flights = Flight.list_upcoming_visible_flights.order(:flight_ref)
    #@available_flights.unshift(@resa.flight)
  end

  # POST /resas
  # POST /resas.json
  def create
    @resa = Resa.new(resa_params)
    respond_to do |format|
      if @resa.save
        format.html { redirect_to edit_resa_path(@resa), notice: 'Mis à jour réussie' }
        format.json { render action: 'show', status: :created, location: @resa }
      else
        format.html { render action: 'new' }
        format.json { render json: @resa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resas/1
  # PATCH/PUT /resas/1.json
  def update
    respond_to do |format|
      if @resa.update(resa_params)
        format.html { redirect_to edit_resa_path(@resa), notice: 'Resa was successfully updated.' }
        format.json { render json: @resa, status: :accepted }

      else
        format.html { render action: 'edit' }
        format.json { render json: @resa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resas/1
  # DELETE /resas/1.json
  def destroy
    @resa.destroy
    respond_to do |format|
      format.html { redirect_to resas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resa
      @resa = Resa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resa_params
      params.require(:resa).permit(:refresa, :check_in_status, :demand, :duree, :paxa, :paxe, :vente, :nom, :telephone, :email, :observation, :flight_id, :flight_time_id, :heure_demand)
    end
end
