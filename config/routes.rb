Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, except: [:index] do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:destroy]
  get 'restaurants', to: 'restaurants#index'
end
