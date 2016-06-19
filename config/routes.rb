Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users

  resources :users
  resources :notes, only: [:new, :create]

end
