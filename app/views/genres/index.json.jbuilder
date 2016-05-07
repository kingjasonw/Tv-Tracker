json.array!(@genres) do |genre|
  json.extract! genre, :id, :genre
  json.url genre_url(genre, format: :json)
end
