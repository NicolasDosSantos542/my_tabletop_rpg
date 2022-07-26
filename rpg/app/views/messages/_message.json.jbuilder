json.extract! message, :id, :pnj, :message, :game_id, :created_at, :updated_at
json.url message_url(message, format: :json)
