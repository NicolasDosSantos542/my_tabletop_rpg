Rails.application.routes.draw do
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
  get '/games', to: "games#index"
  get '/games/:entity/:id', to: "games#getMyGames"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end

