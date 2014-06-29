class Flight < ActiveRecord::Base
	has_many :resas
	belongs_to :flight_time
	accepts_nested_attributes_for :flight_time

	def name_with_details
    	"#{flight_ref}, #{flight_time.try(:flight)} #{time_tk_off} "
  	end

  	def self.list_upcoming_visible_flights
  		where(flight_status:'SHOW').where("flight_date >= ?", Date.today)
  	end

  	def self.day_of_flight
  		where(flight_status:'SHOW').where("flight_date >= ?", Date.today).includes(:resas).group(:flight_date).order(:flight_date).select(:flight_date)
  	end

end
