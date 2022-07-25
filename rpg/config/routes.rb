Rails.application.routes.draw do
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

  resources :choices do
    resources :answers
  end
  resources :steps
  resources :creatures
  get '/games', to: "games#index"
  get '/games/gm/:id', to: "games#getMyGames"
  get '/games/player/:id', to: "games#getMyGames"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end

