Rails.application.routes.draw do
  root "choices#index"

  resources :choices do
    resources :answers
  end


end

