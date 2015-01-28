json.array!(@victims) do |victim|
  json.extract! victim, :id, :name, :age, :country, :city, :link
  json.url victim_url(victim, format: :json)
end
