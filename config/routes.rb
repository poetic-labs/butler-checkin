Rails.application.routes.draw do
  resources :notes
  resources :checkins
  devise_for :users
end
