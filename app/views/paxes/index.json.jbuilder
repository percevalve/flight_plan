json.array!(@paxes) do |pax|
  json.extract! pax, :id, :nom, :prenom, :lieu_de_naissance, :date_de_naissance, :adulte, :enfant, :observations, :flight_id, :resa_id
  json.url pax_url(pax, format: :json)
end
