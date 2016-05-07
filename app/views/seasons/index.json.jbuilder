json.array!(@seasons) do |season|
  json.extract! season, :id, :season_number, :desription
  json.url season_url(season, format: :json)
end
