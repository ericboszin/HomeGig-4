Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'jobs/index'
  get 'reviews/index'
  get 'bid/index'

  resources :jobs 
  resources :reviews
  resources :bids

  root 'jobs#index'
end
