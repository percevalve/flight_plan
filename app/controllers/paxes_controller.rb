class PaxesController < GreetingsController
  before_filter :require_token
  before_action :set_pax, only: [:show, :edit, :update, :destroy]

  # GET /paxes
  # GET /paxes.json
  def index
    @paxes = Pax.all
  end

  # GET /paxes/1
  # GET /paxes/1.json
  def show
  end

  # GET /paxes/new
  def new
    @pax = Pax.new
  end

  # GET /paxes/1/edit
  def edit
  end

  # POST /paxes
  # POST /paxes.json
  def create
    @pax = Pax.new(pax_params)

    respond_to do |format|
      if @pax.save
        format.html { redirect_to @pax, notice: 'Pax was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pax }
      else
        format.html { render action: 'new' }
        format.json { render json: @pax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paxes/1
  # PATCH/PUT /paxes/1.json
  def update
    respond_to do |format|
      if @pax.update(pax_params)
        format.html { redirect_to @pax, notice: 'Pax was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paxes/1
  # DELETE /paxes/1.json
  def destroy
    @pax.destroy
    respond_to do |format|
      format.html { redirect_to paxes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pax
      @pax = Pax.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pax_params
      params.require(:pax).permit(:nom, :prenom, :lieu_de_naissance, :date_de_naissance, :adulte, :enfant, :observations, :flight_id, :resa_id)
    end
end
