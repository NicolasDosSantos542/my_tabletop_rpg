Rails.application.routes.draw do
  resources :creatures
  resources :steps
  resources :choices

  # get 'answer/new', to "answer#index"
  


  # resources :choice do
  #   resources :answers

end
