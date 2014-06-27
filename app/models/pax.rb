class Pax < ActiveRecord::Base
	belongs_to :flight
	belongs_to :resa
	accepts_nested_attributes_for :flight, :resa
end
