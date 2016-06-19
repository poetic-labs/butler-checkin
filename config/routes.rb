Rails.application.routes.draw do
  resources :checkins
  devise_for :users
end
