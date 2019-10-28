Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'jobs/index'
  get 'reviews/index'

  resources :jobs 
  resources :reviews

  root 'jobs#index'
end
