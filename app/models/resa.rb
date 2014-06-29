class Resa < ActiveRecord::Base
	belongs_to :flight
	belongs_to :flight_time
	has_many :paxes, dependent: :destroy
	accepts_nested_attributes_for :paxes


	def name_with_details
		pax = paxe.to_i + paxa.to_i
		if nom.nil?
			"#{telephone} #{email} #{vente} #{observation} - #{pax} PAX"
		else
    		"#{nom} (#{telephone}) - #{pax} PAX"
    	end
  	end

  	def self.all_for_this_date(the_date)
  		includes(:flight).where("(flights.flight_date = ? and flight_id is not null) or (demand = ? and flight_id is null)",the_date,the_date)
  	end
end
