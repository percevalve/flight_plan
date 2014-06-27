class Flight < ActiveRecord::Base
	has_many :resas
	belongs_to :flight_time
	accepts_nested_attributes_for :flight_time

	def name_with_details
    	"#{flight_ref} -> #{flight_date.try(:strftime, "%-d/%-m")}, #{time_tk_off.try(:strftime, "%k:%M")} "
  	end

  	def self.list_upcoming_visible_flights
  		where(flight_status:'SHOW').where("flight_date >= ?", Time.zone.now.beginning_of_day).order(:flight_ref)
  	end
end
