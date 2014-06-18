json.array!(@flights) do |flight|
  json.extract! flight, :id, :flight_ref, :flight_date, :time_tk_off, :flight_name, :pax_blocked, :seats, :flight_status, :remark
  json.url flight_url(flight, format: :json)
end
