Rails.application.routes.draw do
  root to: 'users#index'

  resources :notes
  resources :checkins
  devise_for :users
end
