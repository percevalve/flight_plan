# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'


csv_text = File.read('flight_time.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  FlightTime.create!(row.to_hash)
end

csv_text = File.read('flight.csv', encoding: "ISO8859-1")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
	row['flight_date'] = Date.strptime(row['flight_date'], "%m/%d/%y") unless row["flight_date"] == "#VALUE!"
	row['flight_time_id'] = FlightTime.where(flight: row['FlightName']).first.id unless FlightTime.where(flight: row['FlightName']) == 0
	row.delete('FlightName')
	Flight.create!(row.to_hash)
end

csv_text = File.read('resa.csv', encoding: "ISO8859-1")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
	puts row['demand']
	if !row["demand"].nil?
		begin
			row['demand'] = Date.strptime(row['demand'], "%d/%m, %a")
		rescue
			puts "#{row['refresa']} => #{row['demand']}, #{ Resa.last.id + 1}"
			row['observation'] += "pb de date #{row['demand']}"
			row['demand'] = Date.strptime(row['demand'], "%d/%m, %a")
		end
	end
	row['flight_time_id'] = FlightTime.where(flight: row['FlightName']).first.id unless FlightTime.where(flight: row['FlightName']).count == 0
	row['flight_id'] = Flight.where(flight_ref: row['flight']).first.id unless Flight.where(flight_ref: row['flight']).count == 0
	row.delete('FlightName')
	row.delete('flight')
	Resa.create!(row.to_hash)
end