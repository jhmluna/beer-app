Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :beers
  resources :users, only: %i[show edit update] do
    get 'sales', to: 'users#sale'
  end
  resources :orders, only: %i[index new create]
end
