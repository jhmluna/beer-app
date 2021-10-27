Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :beers
  resources :users, only: %i[show edit update]
  resources :orders, only: %i[new create]
end
