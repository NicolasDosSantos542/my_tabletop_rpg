json.extract! game, :id, :name, :description, :gm_id, :channel_id, :created_at, :updated_at
json.url game_url(game, format: :json)
