json.extract! player, :id, :login, :password, :created_at, :updated_at
json.url player_url(player, format: :json)
