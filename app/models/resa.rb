class Resa < ActiveRecord::Base
	belongs_to :flight
	has_many :paxes, dependent: :destroy
	accepts_nested_attributes_for :paxes
end
