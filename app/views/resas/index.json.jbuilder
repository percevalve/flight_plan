json.array!(@resas) do |resa|
  json.extract! resa, :id, :refresa, :demand, :duree, :paxa, :paxe, :vente, :nom, :telephone, :email, :observation
  json.url resa_url(resa, format: :json)
end
