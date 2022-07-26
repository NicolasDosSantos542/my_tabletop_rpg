Rails.application.routes.draw do
  resources :characters
  resources :chapters
  resources :loots
  resources :game_players
  resources :players
  resources :gms
  get '/', to: "home#index"
  get '/home/gm', to: "home#loggm"
  get '/home/player', to: "home#logplayer"

  resources :messages
  resources :games
  resources :channels
  resources :home
  root "home#index"
  post '/home/logingm', to: "home#logingm"
  post '/home/loginplayer', to: "home#loginplayer"
  post '/home/disconnect', to: "home#disconnect"

  resources :choices do
    resources :answers
  end
  resources :steps
  resources :creatures
  get '/games', to: "games#index"
  post '/games/firstjoin/:game_id', to: "games#playerJoinGame"
  get '/games/viewAll/:entity/:id', to: "games#getMyGames"

  get '/games/character/new/:game_id', to: "characters#new"
  post '/games/character/new/:game_id', to: "characters#create"

  post '/game_players/leave/:game_id', to: "game_players#playerLeaveGame"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end

