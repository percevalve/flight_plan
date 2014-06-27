json.array!(@flight_times) do |flight_time|
  json.extract! flight_time, :id, :flight, :time
  json.url flight_time_url(flight_time, format: :json)
end
