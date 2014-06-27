class FlightTime < ActiveRecord::Base

	def name_with_flight_time
    	"#{flight} (#{time.try(:strftime, "%k:%M")})"
  	end
end
