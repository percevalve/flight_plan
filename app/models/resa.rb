class Resa < ActiveRecord::Base
	belongs_to :flight
	belongs_to :flight_time
	has_many :paxes, dependent: :destroy
	accepts_nested_attributes_for :paxes


	def name_with_details
		if nom.nil?
			"#{telephone} #{email} #{vente} #{observation} - #{paxt}"
		else
    		"#{nom} (#{telephone}) - #{paxt}"
    	end
  	end

  	def paxt
  		pax = paxe.to_i + paxa.to_i
  		paxt = "#{pax} PAX ("
  		paxt += "#{paxa}Ad," unless paxa.nil?
  		paxt += "#{paxe}Ef," unless paxe.nil?
  		paxt = paxt[0..-2] + ")"
  	end

  	def info_vol
  		if flight.nil?
  			"#{demand} #{heure_demand} #{flight_time.try(:name_with_flight_time)}"
  		else
  			flight.name_with_details
  		end
  	end

  	def self.all_for_this_date(the_date)
  		includes(:flight).where("(flights.flight_date = ? and flight_id is not null) or (demand = ? and flight_id is null)",the_date,the_date)
  	end

    def self.all_for_those_dates(start_date,end_date)
      resultat = Resa.includes(:flight)
      if start_date.is_a?(Date)
        resultat = resultat.where("(flights.flight_date >= ? and flight_id is not null) or (demand >= ? and flight_id is null)",start_date,start_date).references(:flights)
      end
      if end_date.is_a?(Date)
        resultat = resultat.where("(flights.flight_date <= ? and flight_id is not null) or (demand <= ? and flight_id is null)",end_date,end_date).references(:flights)
      end
      return resultat
    end

    def self.no_flight_assigned
      where("flight_id is null")
    end
end
