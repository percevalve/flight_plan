class FlightStatusController < ApplicationController
  def overview
  	@flights = Flight.list_upcoming_visible_flights
  	@seats_per_day = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_date).sum(:seats)
  	@pax_blocked_per_day = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_date).sum(:pax_blocked)
  	@paxa_per_day = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_date).sum(:paxa)
  	@paxe_per_day = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_date).sum(:paxe)

  	@paxa_per_flight = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_ref).sum(:paxa)
  	@seats_per_flight = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_ref).sum(:seats)
  	@paxe_per_flight = Flight.list_upcoming_visible_flights.joins(:resas).group(:flight_ref).sum(:paxe)
  end

  def daily
  	@flights = Flight.list_upcoming_visible_flights.where(flight_date: Date.strptime(params[:flight_date], "%d/%m/%Y"))
  end
end
