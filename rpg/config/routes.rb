Rails.application.routes.draw do
  root "choices#index"

  resources :choices

  # resources :choice do
  #   resources :answers

end

