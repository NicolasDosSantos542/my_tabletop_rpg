json.extract! game, :id, :name, :description, :channel_id, :created_at, :updated_at
json.url game_url(game, format: :json)
