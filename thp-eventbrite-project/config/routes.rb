Rails.application.routes.draw do
  root to: 'events#index'

  # get 'static_pages/secret', to: 'static_pages#secret'

  devise_for :users

  resources :attendances
  resources :events
  resources :users
end
