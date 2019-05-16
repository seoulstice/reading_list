Rails.application.routes.draw do

  root "home#index"

  resources :users, only: [:new, :create, :show]

  get '/search', to: 'search#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
