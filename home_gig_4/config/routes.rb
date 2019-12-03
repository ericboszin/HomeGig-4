Rails.application.routes.draw do
  get 'home/index'
  get 'home/owner'
  get 'home/worker'
  get 'home/admin'
  get 'jobs/explore'

  get '/about', to: 'static#about'
  get '/contactus', to: 'static#contactus'
  get '/FAQ', to: 'static#faq'
  get '/privacy', to: 'static#privacy'
  get '/sitemap', to: 'static#sitemap'
  get '/tos', to: 'static#tos'

  # 404 Page
  get '/error', to: 'static#not_found'

  post '/contact/form', to: 'static#message'

  devise_for :users, :path_prefix => 'd'
  resources :users, :only => [:show]
#match '/users/:id',     to: 'users#show',       via: 'get'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# get 'jobs/index'
# get 'reviews/index'

  resources :jobs do
    resources :bids do
      patch 'accept'
      delete 'reject'
      patch 'revert_bid'
      get '*path' => redirect('/error')
    end
    patch 'complete_job'
    patch 'accept_bids'
    patch 'cancel_job'
    get '*path' => redirect('/error')
    get 'cost'
    resources :reviews
  end

  resources :reports do
    get '*path' => redirect('/error')
    patch 'resolve'
    patch 'unresolve'
  end
  
  resources :settings do
    get '*path' => redirect('/error')
  end
  resources :billing, :only => [:new, :create]
  post 'charge', to: 'billing#create', as: :charge


  root :to => 'passthrough#index'
  get '/404' => redirect('/error')
  get '/422' => redirect('/error')
  get '/500' => redirect('/error')
  get '*path' => redirect('/error')
end
