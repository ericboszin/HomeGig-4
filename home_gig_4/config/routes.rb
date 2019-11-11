Rails.application.routes.draw do
  get 'home/index'
  get 'home/owner'
  get 'home/worker'
  get 'home/admin'
  get 'jobs/explore'

devise_for :users, :path_prefix => 'd'
resources :users, :only =>[:show]
#match '/users/:id',     to: 'users#show',       via: 'get'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'jobs/index'
  # get 'reviews/index'

  resources :jobs do
  	resources :bids do
  	  patch 'accept'
    end
    patch 'accept_bids'
    get 'cost'
  	resources :reviews
  end




  root 'home#index'
end
