json.array!(@episodes) do |episode|
  json.extract! episode, :id, :title, :episode_number, :description
  json.url episode_url(episode, format: :json)
end
