Rails.application.routes.draw do
  resources :gms
  get 'home/index'
  post 'home/login', to: "home#login"
  resources :messages
  resources :games
  resources :channels
  resources :homes
  root "home#index"

  resources :choices do
    resources :answers
  end
  resources :steps
  get '/games', to: "games#index"
  get '/games/gm/:id', to: "games#getMyGames"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end

