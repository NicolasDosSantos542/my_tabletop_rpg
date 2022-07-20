Rails.application.routes.draw do
  resources :gms
  get 'home/index'
  post 'home/login', to: "home#login"
  resources :messages
  resources :games
  resources :channels
  resources :homes
  root "home#index"

  get '/games', to: "games#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
