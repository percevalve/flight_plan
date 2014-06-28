class FlightStatusController < GreetingsController
  before_filter :require_token
  def overview
  	@flights = Flight.list_upcoming_visible_flights.order(:flight_ref)
  	@seats_per_day = Flight.list_upcoming_visible_flights.includes(:resas).group(:flight_date).sum(:seats)
  	@pax_blocked_per_day = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_date).sum(:pax_blocked)
  	@paxa_per_day = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_date).sum(:paxa)
  	@paxe_per_day = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_date).sum(:paxe)
  	@paxa_per_flight = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_ref).sum(:paxa)
  	@seats_per_flight = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_ref).sum(:seats)
  	@paxe_per_flight = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_ref).sum(:paxe)
  end

  def daily
    @jour = Date.strptime(params[:flight_date], "%d/%m/%y")
  	@flights = Flight.list_upcoming_visible_flights.where(flight_date: @jour).order(:flight_ref)
    @paxa_per_flight = @flights.joins(:resas).group(:flight_ref).sum(:paxa)
    @seats_per_flight = @flights.joins(:resas).group(:flight_ref).sum(:seats)
    @paxe_per_flight = @flights.joins(:resas).group(:flight_ref).sum(:paxe)
    @pax_blocked_per_flight = @flights.joins(:resas).group(:flight_ref).sum(:pax_blocked)
  end

end
