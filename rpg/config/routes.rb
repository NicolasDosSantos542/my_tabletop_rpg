Rails.application.routes.draw do
  resources :messages
  resources :games
  resources :channels
  root "games#index"

  get '/games', to: "games#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
